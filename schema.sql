-- Users table (drivers + companies)
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) CHECK (role IN ('driver', 'company')) NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20),

  -- Driver fields
  truck_number VARCHAR(50),
  truck_model VARCHAR(100),
  fuel_type VARCHAR(20) CHECK (fuel_type IN ('diesel', 'cng', 'electric')),
  max_weight_kg FLOAT,
  max_volume_cuft FLOAT,

  -- Company fields
  company_name VARCHAR(255),
  gst_number VARCHAR(50),
  address TEXT,

  created_at TIMESTAMP DEFAULT NOW()
);

-- Truck listings (driver posts available space)
CREATE TABLE truck_listings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  driver_id UUID REFERENCES users(id) ON DELETE CASCADE,
  from_city VARCHAR(100) NOT NULL,
  to_city VARCHAR(100) NOT NULL,
  from_lat FLOAT,
  from_lng FLOAT,
  to_lat FLOAT,
  to_lng FLOAT,
  departure_time TIMESTAMP NOT NULL,
  booking_window_hours INT DEFAULT 3,
  total_weight_kg FLOAT NOT NULL,
  total_volume_cuft FLOAT NOT NULL,
  used_weight_kg FLOAT DEFAULT 0,
  used_volume_cuft FLOAT DEFAULT 0,
  cargo_types_accepted VARCHAR(100) DEFAULT 'All',
  optimized_route JSONB,          -- Stored Google Maps route
  status VARCHAR(20) DEFAULT 'open'
    CHECK (status IN ('open', 'in_transit', 'completed')),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Bookings (company books space on a listing)
CREATE TABLE bookings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id UUID REFERENCES truck_listings(id),
  company_id UUID REFERENCES users(id),
  cargo_description TEXT,
  weight_kg FLOAT NOT NULL,
  volume_cuft FLOAT NOT NULL,
  has_insurance BOOLEAN DEFAULT FALSE,
  total_price FLOAT,
  carbon_saved_kg FLOAT,
  razorpay_order_id VARCHAR(255),
  razorpay_payment_id VARCHAR(255),
  status VARCHAR(20) DEFAULT 'pending'
    CHECK (status IN ('pending','accepted','rejected','paid','delivered')),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Trips (active movement tracking)
CREATE TABLE trips (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  listing_id UUID REFERENCES truck_listings(id),
  current_lat FLOAT,
  current_lng FLOAT,
  distance_remaining_km FLOAT,
  eta_minutes INT,
  started_at TIMESTAMP DEFAULT NOW(),
  completed_at TIMESTAMP
);

