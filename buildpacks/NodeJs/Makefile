PWD     = github.com/iBuildpacks/buildpacks
TARGETS = $(patsubst src/%,%,$(wildcard src/*))

all: $(TARGETS)

$(TARGETS):
	GOOS=linux go build -o bin/$@ -v ./src/$@
