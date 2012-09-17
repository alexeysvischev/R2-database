@echo off

echo Importing YTDB database
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=scriptdev2 < "sql/scriptdev2_create_structure_mysql.sql"
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=scriptdev2 < "scriptdev2/custom_scriptdev2_bsw_table.sql"
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos < "sql/mangos_scriptname_clear.sql"
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos < "sql/mangos_scriptname_full.sql"

echo.
echo Importing MaNGOSR2 files
for %%i in (scriptdev2\mr*mangos*sql) do if %%i neq scriptdev2\mr*mangos*sql if %%i neq scriptdev2\mr*mangos*sql if %%i neq scriptdev2\mr*mangos*sql echo %%i & mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos < %%i

echo.
echo Importing ScriptDev2 R2 files
for %%i in (scriptdev2\mr*scriptdev2*sql) do if %%i neq scriptdev2\mr*scriptdev2*sql if %%i neq scriptdev2\mr*scriptdev2*sql if %%i neq scriptdev2\mr*scriptdev2*sql echo %%i & mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=scriptdev2 < %%i

echo.
echo Last mangos files
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos < "scriptdev2/last_mangos_sql_at_every_db_update.sql"
mysql -u root --password=123456 -h 127.0.0.1 --port=3310 --database=mangos < "sql_mr/custom_rerun_every_mangos_DB_update.sql
echo.
pause
exit