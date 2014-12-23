use db_akuntan;
SELECT  accounting_transaction.TRANSACTION_DATE, accounting_transaction.DESCRIPTION,transaction_detail.AMOUNT,ogl_account_balance.AMOUNT as TOTAL, gl_account.DESCRIPTION as TYPE,transaction_detail.DEBIT_CREDIT_FLAG,gl_type.DESCRIPTION AS CATEGORY
FROM ogl_account_balance,transaction_detail,accounting_transaction,gl_account,gl_type 
where SUBSTR(ogl_account_balance.GL_ACCOUNT_ID,1,1)=3
AND  ogl_account_balance.ID_OGL_ACCOUNT_BALANCE=transaction_detail.ID_OGL_ACCOUNT_BALANCE 
AND transaction_detail.ID_TRANS=accounting_transaction.ID_TRANS 
AND gl_account.GL_ACCOUNT_ID=ogl_account_balance.GL_ACCOUNT_ID
AND gl_type.ID_TYPE=substr(gl_account.GL_ACCOUNT_ID,1,1);
