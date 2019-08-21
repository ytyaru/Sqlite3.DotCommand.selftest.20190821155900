SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
".selftest --init" \
"delete from SELFTEST;" \
"insert into SELFTEST(op,cmd,ans) values('', 'select 1;', '1');" \
"select * from SELFTEST;" \
".selftest"

