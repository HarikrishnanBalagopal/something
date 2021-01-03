GIT_DIRTY  = $(shell test -n "`git status --porcelain`" && echo "dirty" || echo "clean")
GIT_DIFF = $(shell git ls-files -o --exclude-standard | tr '\n' ',')

.PHONY: all
all: clean build

.PHONY: clean
clean:
	rm -rf dist/

.PHONY: build
build:
	go build -o dist/something -ldflags="-X 'main.GitDirty=${GIT_DIRTY}' -X 'github.com/HarikrishnanBalagopal/something/something.GitDiffFileNames=${GIT_DIFF}'" main.go
