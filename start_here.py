#

import requests
from datetime import datetime, timezone

timezone
print(str(timezone))

def blarg(cows_pass_gas=None):
	print("""cows pass gas""")
	cows_pass_gas = True
	return cows_pass_gas


def starter_test():
	"""
	something we can start testing
	:return:
	"""
	# for each time it runs n+1
	# when he starts up he prints on screen run or epic#n etc
	print("starter_test function has run")



def turn_on_pandas():
	"""
	implement a method to turn on pandas for
	:return:
	"""
	PANDAS_POWER = False
	print("PANDAS_POWER is TRUE")


def main():
	"""
	# TODO add version control for package changes
	#
	should run when python 3.10 user runs `start_here.py` file
	:return:
	"""
	blarg()
	turn_on_pandas()


if __name__ == "__main__":
	main()
	SQL_DB_ACTIVE = False
	SQL_DB_STATE = 'TEST'
	SQL_DB_SQLITE = 'TEST'
	SQL_DB_MYSQL = 'TEST'
	SQL_DB_SSMS = 'TEST'
	SQL_DB_POST = 'TEST'
	SQL_DB_ORACLE = 'TEST'
	# if cows_pass_gas = True