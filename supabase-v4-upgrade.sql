-- 记账 v4：自动同步所需的小升级
alter table public.expenses
  add column if not exists deleted_at timestamptz;

create index if not exists expenses_user_updated_at_idx
  on public.expenses (user_id, updated_at desc);
