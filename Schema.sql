-- Users table
create table users (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  email text unique not null,
  created_at timestamp default now()
);

-- Events table
create table events (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  description text,
  event_date date not null,
  creator_id uuid references users(id),
  created_at timestamp default now()
);

-- RSVPs table
create table rsvps (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references users(id) on delete cascade,
  event_id uuid references events(id) on delete cascade,
  created_at timestamp default now()
);
