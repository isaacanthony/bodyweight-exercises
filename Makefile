jupyter-start:
	@docker run \
		--name jupyter \
		-d \
		-e JUPYTER_ENABLE_LAB=yes \
		-p 8888:8888 \
		-v $(PWD):/home/jovyan \
		jupyter/scipy-notebook
	@sleep 3
	@make -s jupyter-token

jupyter-token:
	@docker exec -it jupyter jupyter notebook list

jupyter-stop:
	@docker stop jupyter
	@docker rm jupyter
