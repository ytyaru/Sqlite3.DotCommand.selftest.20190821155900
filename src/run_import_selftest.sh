SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

echo "tno,op,cmd,ans
1,run,\"select 1;\",1
2,memo,\"コメント\"," > selftests.csv

cat selftests.csv

sqlite3 :memory: \
".mode csv" \
".import selftests.csv selftest" \
".selftest"

