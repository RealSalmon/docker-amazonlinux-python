DEFAULT_GOAL := image

image:
	docker build -t local/amazonlinux-python .

shell:
	docker run --rm -i -t local/amazonlinux-python bash

root:
	docker run --rm -i -t -u root local/amazonlinux-python bash
