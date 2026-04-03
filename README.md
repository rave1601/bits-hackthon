# bits-hackthon
Step 1 — PostgreSQL:
psql -U postgres -d loadmate -f schema.sql
Step 2 — Redis: start it
redis-server
Verify it's running: redis-cli ping → should reply PONG.
Step 3 — Backend: FastAPI
venv\Scripts\activate

pip install -r requirements.txt
uvicorn main:app --reload --port 8000

Open http://localhost:8000 → should show {"status": "LoadMate API running"}.
Open http://localhost:8000/docs 

Step 4 — React web dashboard
cd loadmate/company-web
npm install
npm run dev

Step 5 — React Native driver app
cd loadmate/driver-app
npm install
# Start Metro bundler
npx react-native start

# In a second terminal — Android
npx react-native run-android


Step 6 — Verify the full flow works
Go to http://localhost:8000/docs and test in this order:

POST /api/auth/register — create a driver account
POST /api/auth/register — create a company account
POST /api/auth/login — login as driver, copy the token
Click "Authorize" in Swagger, paste Bearer <token>
POST /api/trucks/post — post a listing
Login as company, GET /api/trucks/search — confirm it appears
POST /api/bookings/ — create a booking
POST /api/payments/create-order/{booking_id} — get Razorpay order
