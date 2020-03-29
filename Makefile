build:
	docker build -t task-manager .

bash:
	docker run -it -v /home/ingprog/test/trello:/task_manager task-manager bash