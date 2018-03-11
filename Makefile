image:
	docker build -t local/amazonlinux-python .

shell:
	docker run --rm -i -t local/amazonlinux-python bash
