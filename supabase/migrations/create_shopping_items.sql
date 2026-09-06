-- 쇼핑 리스트 아이템 테이블
create table if not exists public.shopping_items (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(name) between 1 and 100),
  done boolean not null default false,
  created_at timestamptz not null default now()
);

-- 목록 정렬용 인덱스
create index if not exists shopping_items_created_at_idx
  on public.shopping_items (created_at);

-- RLS 활성화 (로그인 없는 공개 앱이므로 anon 역할에 CRUD 허용)
alter table public.shopping_items enable row level security;

create policy "anon can select shopping_items"
  on public.shopping_items for select to anon using (true);

create policy "anon can insert shopping_items"
  on public.shopping_items for insert to anon with check (true);

create policy "anon can update shopping_items"
  on public.shopping_items for update to anon using (true) with check (true);

create policy "anon can delete shopping_items"
  on public.shopping_items for delete to anon using (true);
