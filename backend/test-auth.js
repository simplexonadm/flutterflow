// Script para testar endpoints de autenticação
const http = require('http');

function makeRequest(method, path, data) {
  return new Promise((resolve, reject) => {
    const options = {
      hostname: 'localhost',
      port: 3000,
      path: path,
      method: method,
      headers: {
        'Content-Type': 'application/json',
      },
    };

    const req = http.request(options, (res) => {
      let responseData = '';
      res.on('data', (chunk) => {
        responseData += chunk;
      });
      res.on('end', () => {
        try {
          resolve({
            status: res.statusCode,
            data: JSON.parse(responseData),
          });
        } catch (e) {
          resolve({
            status: res.statusCode,
            data: responseData,
          });
        }
      });
    });

    req.on('error', reject);

    if (data) {
      req.write(JSON.stringify(data));
    }
    req.end();
  });
}

async function runTests() {
  console.log('🧪 Testando endpoints de autenticação...\n');

  try {
    // Test 1: Register
    console.log('1️⃣ Testando POST /api/auth/register');
    const registerRes = await makeRequest('POST', '/api/auth/register', {
      email: 'teste@example.com',
      password: 'senha123',
    });
    console.log('Status:', registerRes.status);
    console.log('Response:', JSON.stringify(registerRes.data, null, 2));
    console.log();

    let accessToken = null;
    if (registerRes.data.tokens) {
      accessToken = registerRes.data.tokens.accessToken;
    }

    // Test 2: Get Profile
    if (accessToken) {
      console.log('2️⃣ Testando GET /api/auth/me');
      const profileRes = await makeRequest('GET', '/api/auth/me', null);
      console.log('Status:', profileRes.status);
      console.log('Response:', JSON.stringify(profileRes.data, null, 2));
      console.log();
    }

    // Test 3: Login
    console.log('3️⃣ Testando POST /api/auth/login');
    const loginRes = await makeRequest('POST', '/api/auth/login', {
      email: 'teste@example.com',
      password: 'senha123',
    });
    console.log('Status:', loginRes.status);
    console.log('Response:', JSON.stringify(loginRes.data, null, 2));
    console.log();

    console.log('✅ Testes concluídos!');
  } catch (error) {
    console.error('❌ Erro durante testes:', error);
  }

  process.exit(0);
}

runTests();
