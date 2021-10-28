-- What are the names and ids of all users who have more than 5 assigned tasks unfinished?
SELECT USer.userID, User.firstName, COUNT (*)AS nums
FROM
Assignment
INNER JOIN Task
ON Assignment.taskID = Task.taskID
INNER JOIN User
ON Assignment.userID= User.userID
WHERE Task.status = 0
GROUP BY(Assignment.userID)
HAVING COUNT(*) >5;
-- How many list has more than 2 ufinished tasks with priority of hign?
SELECT COUNT(*)
FROM
(	SELECT COUNT(*) AS Nums
	FROM  Task
    INNER JOIN List
    ON Task.listID = list.listID
	WHERE Task.status = 0 AND Task.priority = 2
	GROUP BY(Task.listID)
     HAVING COUNT(*) >2
);
	
--What are the unscheduled work and personal tasks?
SELECT Task.taskID, Task.title AS taskTitle
FROM (Task
INNER JOIN Tag_Task
ON Tag_Task.taskID = task.taskID)
INNER JOIN Tag
ON Tag.tagID = Tag_Task.tagID
WHERE  (Tag.tagID = 1 OR Tag.tagID =3 ) AND Task.dueDate is NULL;

--List all the unfinished tasks in book writing with their priority:
SELECT Task.title, Task.dueDate,
	(CASE Task.priority
		when "0" THEN "low"
		when "1" THEN "medium"
		when "2" THEN "high"
		ELSE "null"
		END
		)priority
FROM Task
  WHERE Task.listID= 6 AND task.status = 0
  ORDER BY Task.priority DESC;
  
 -- List the numbers of tasks that is due in November and December with the number of task, and their due date.
SELECT count(Task.taskID) AS count_tasks, Task.dueDate
FROM Task
WHERE Task.dueDate is not NULL
GROUP BY dueDate
HAVING dueDate <= '2021-12-31' and dueDate >= '2021-11-1';