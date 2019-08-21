SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

echo "create table selftest(
  tno INTEGER PRIMARY KEY,
  op TEXT default('run') check(op='memo' or op='run'),
  cmd TEXT,
  ans TEXT
);" > selftest_create.sql

sqlite3 :memory: \
".read selftest_create.sql" \
"insert into SELFTEST(cmd,ans) values('select 1;', '1');" \
"insert into SELFTEST(op,cmd) values('memo','コメント');" \
".selftest"

