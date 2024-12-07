# 変数定義
IMAGE_NAME = testimage
CONTAINER_NAME = test-container

# イメージのビルド
.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

# コンテナの起動（シェルアクセス）
.PHONY: up
up:
	docker run -it --rm --name $(CONTAINER_NAME) $(IMAGE_NAME) /bin/sh

# イメージとコンテナの削除
.PHONY: clean
clean:
	docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	docker rmi $(IMAGE_NAME) 2>/dev/null || true

# ヘルプ
.PHONY: help
help:
	@echo "使用可能なコマンド:"
	@echo "  make build    - Dockerイメージをビルド"
	@echo "  make up       - コンテナを起動してシェルアクセス"
	@echo "  make clean    - イメージとコンテナを削除"
