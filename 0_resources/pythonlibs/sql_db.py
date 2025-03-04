import sys
from robot.api import logger

def query_xml(self, selectStatement, sansTran=False, returnAsDict=False):
        """
        Uses the input `selectStatement` to query for the values that will be returned as a list of tuples. Set optional
        input `sansTran` to True to run command without an explicit transaction commit or rollback.
        Set optional input `returnAsDict` to True to return values as a list of dictionaries.

        Tip: Unless you want to log all column values of the specified rows,
        try specifying the column names in your select statements
        as much as possible to prevent any unnecessary surprises with schema
        changes and to easily see what your [] indexing is trying to retrieve
        (i.e. instead of `"select * from my_table"`, try
        `"select id, col_1, col_2 from my_table"`).

        For example, given we have a table `person` with the following data:
        | id | first_name  | last_name |
        |  1 | Franz Allan | See       |

        When you do the following:
        | @{queryResults} | Query | SELECT * FROM person |
        | Log Many | @{queryResults} |

        You will get the following:
        [1, 'Franz Allan', 'See']

        Also, you can do something like this:
        | ${queryResults} | Query | SELECT first_name, last_name FROM person |
        | Log | ${queryResults[0][1]}, ${queryResults[0][0]} |

        And get the following
        See, Franz Allan

        Using optional `sansTran` to run command without an explicit transaction commit or rollback:
        | @{queryResults} | Query | SELECT * FROM person | True |
        """
        cur = None
        try:
            cur = self._dbconnection.cursor()
            logger.info('Executing : Query  |  %s ' % selectStatement)
            self.__execute_sql(cur, selectStatement)
            result = cur.fetchone()[0].read()
            if returnAsDict:
                mappedRows = []
                for res in result:
                    mappedRows.append(res[0].read())
                    return mappedRows
            return result            

        finally:
            if cur:
                if not sansTran:
                    self._dbconnection.rollback()

def __execute_sql(self, cur, sqlStatement):
    return cur.execute(sqlStatement)