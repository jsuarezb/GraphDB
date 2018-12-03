FOR %%v IN (4 5 6 7 8) DO (
	FOR %%q IN (a b c) DO (
 		psql -U postgres -f q2_%%q.sql -v schema=grupo2v%%v -o NUL
	)
)

cmd /k