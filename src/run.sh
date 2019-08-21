SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

./run_import_selftest.sh
./run_testcase_check.sh
./run_use_my_selftest.sh
./run_use_op_error.sh
./run_use_miss.sh
./run_use.sh

