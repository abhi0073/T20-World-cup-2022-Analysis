CREATE DATABASE T20WORLDCUP2022;

USE T20WORLDCUP2022;

                                        /* OVERVIEW OF T20 WORLD CUP 2022 */
                                        
/* MATCHES BY TOSS DECISION */

SELECT `decision` AS DECISION, COUNT(`id`) AS MATCHES
FROM `summary`
GROUP BY DECISION;

/* OVERVIEW MATCHES OF THE TEAM */

SELECT `short_name` AS TEAMS, `toss_won` AS TOSS_WON, `decision` AS DECISION,
`1st_inning_score` AS 1ST_INNING_SCORE, `2nd_inning_score` AS 2ND_INNING_SCORE, `winner` AS WINNER
FROM `summary`;

/* WINNER TEAM BY STADIUM AND DECISION */

SELECT distinct`venue_name` AS STADIUM, `decision` AS DECISION,
COUNT(`winner`) AS NO_OF_WINNER
FROM `summary`
GROUP BY STADIUM, DECISION;

                                        /* BATSMAN SUMMARY OF T20 WORLD CUP 2022 */
                                        
/* TOTAL MATCHES */

SELECT COUNT( distinct `match_id`) AS MATCHES
FROM `batting_card`;

/* TOTAL RUNS */

SELECT SUM(`runs`) AS RUNS
FROM `batting_card`;

/* TOTAL FOURS */

SELECT SUM(`fours`) AS FOURS
FROM `batting_card`;

/* TOTAL SIXES */

SELECT SUM(`sixes`) AS SIXES
FROM `batting_card`;

/* AVERAGE OF RUNS */

SELECT AVG(`runs`) AS AVERAGE
FROM `batting_card`;

                                /* BATSMAN OVERVIEW */
                           
SELECT `fullName` AS BATSMAN, SUM(`runs`) AS RUNS, SUM(`ballsFaced`) AS BALLFACED,
SUM(`fours`) AS FOURS, SUM(`sixes`) AS SIXES, ROUND(AVG(`strikeRate`),2) AS STRIKERATE
FROM `batting_card`
GROUP BY BATSMAN
ORDER BY RUNS DESC;

                                /* BEST PERFORMANCE OF THE TOURNAMENR (BATSMAN) */
                                
SELECT `fullName` AS BATSMAN, COUNT( DISTINCT `match_id`) AS MATCHES, SUM(`runs`) AS RUNS, ROUND(AVG(`runs`),2) AS AVERAGE,
SUM(`fours`) AS FOURS, SUM(`sixes`) AS SIXES, MAX(`runs`) AS HIGHESTSCORE
FROM `batting_card`
GROUP BY BATSMAN
HAVING `fullName` = 'Virat Kohli';

                                           /* BOWLER SUMMARY OF T20 WORLD CUP 2022 */
                                           
/* TOTAL MATCHES */

SELECT COUNT(DISTINCT `match_id`) AS MATCHES
FROM `bowling_card`;

/* TOTAL OVERS */

SELECT SUM(`overs`) AS OVERS
FROM `bowling_card`;

/* TOTAL WICKETS */

SELECT SUM(`wickets`) AS WICKETS
FROM `bowling_card`;

/* TOTAL MAIDENS */

SELECT SUM(`maidens`) AS MAIDENS
FROM `bowling_card`;

/* TOTAL ECONOMYRATE */

SELECT ROUND(SUM(`economyRate`),0) AS ECONOMYRATE
FROM `bowling_card`;

                                              /* BOWLER OVERVIEW */
                                              
SELECT `fullName` AS BOWLERNAME, SUM(`conceded`) AS RUNS, SUM(`wickets`) AS WICKETS,
SUM(`maidens`) AS MAIDENS, SUM(`overs`) AS OVERS, SUM(`wides`) AS WIDES, SUM(`noballs`) AS NOBALLS
FROM `bowling_card`
GROUP BY BOWLERNAME
ORDER BY WICKETS DESC;

                                              /* BEST PERFORMANCE OF THE TOURNAMENR (BOWLER) */

SELECT `fullName` AS BOWLER, SUM(`wickets`) AS WICKETS, ROUND(SUM(`economyRate`),2) AS ECONOMYRATE,
SUM(`maidens`) AS MAIDENS, MAX(`wickets`) AS HIGHEST, MIN(`conceded`) AS SCORE
FROM `bowling_card`
GROUP BY BOWLER
HAVING `fullName` = 'Wanindu Hasaranga de Silva';