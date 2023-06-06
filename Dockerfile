

FROM ubuntu AS build

RUN apt-get update && apt-get install -y golang-go

ENV GO111MODULE=off

COPY . .

RUN CGO_ENABLED=0 go build -o /app .


FROM ubuntu

# Copy the compiled binary from the build stage
COPY --from=build /app /app

# Set the entrypoint for the container to run the binary
ENTRYPOINT ["/app"]
