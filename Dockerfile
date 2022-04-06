FROM alpine:3.15.4
MAINTAINER Fleet Developers <engineering@fleetdm.com>

RUN apk --update add ca-certificates

# Create FleetDM group and user
RUN addgroup -S fleet && adduser -S fleet -G fleet

COPY ./build/binary-bundle/linux/fleet ./build/binary-bundle/linux/fleetctl /usr/bin/

USER fleet
CMD ["fleet", "serve"]
