SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
".selftest --init" \
"delete from SELFTEST;" \
"insert into SELFTEST(op,cmd,ans) values('run', 'select 1;', '1');" \
"insert into SELFTEST(op,cmd,ans) values('run', 'select 1.2;', '1.2');" \
"insert into SELFTEST(op,cmd,ans) values('run', 'select ''A'';', 'A');" \
"insert into SELFTEST(op,cmd,ans) values('run', 'select x''FF'';', x'FF');" \
"insert into SELFTEST(op,cmd,ans) values('run', 'select 1, ''A'' union select 2, ''B'';', '1,A|2,B');" \
"select * from SELFTEST;" \
".selftest"

