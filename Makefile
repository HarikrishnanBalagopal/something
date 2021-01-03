GIT_DIRTY  = $(shell test -n "`git status --porcelain`" && echo "dirty" || echo "clean")
GIT_DIFF = $(shell git diff --name-only | tr '\n' ',')

.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -rf dist/

.PHONY: build
build:
	go build -o dist/something -ldflags="-X 'main.Y=${GIT_DIRTY}' -X 'github.com/HarikrishnanBalagopal/something/something.GitDiffFileNames=${GIT_DIFF}'" main.go
