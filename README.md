## WHAT IS THIS?

FreeRADIUS is an open source implementation of RADIUS, an IETF protocol for AAA (Authorisation, Authentication, and Accounting). One very popular use for a RADIUS server is to enable 802.1X authentication for network access (wi-fi, ethernet). Certificates can be leveraged to control access to networks for security purposes, and simplify authentication for users.

## WHY USE THIS?

There are many implementations of RADIUS, commercial and opensource. FreeRADIUS is a popular, secure, and mature project that has stood the test of time. It is used in business and in personal configurations alike. For these reasons, it is often the preferred solution for opensource deployments.

## USAGE

This FreeRADIUS server package has been pre-configured to provide EAP-TLS authentication via certificates.

1. Place the following certificate file types in the raddb/certs folder:

    - ca certificate
    - server certificate
    - server key

2. Define the following environment variables (either in ./vars.env, or in your local environment):

    - CLIENT_ADDRESS=*listen ip cidr range*
    - CLIENT_SECRET=*shared secret string*
    - SERVER_KEY_FILE=*server key file name*
    - SERVER_CERT_FILE=*server certificate file name*
    - CA_CERT_FILE=*ca certificate file name*

3. Build the server container:

        ./run.sh --build

4. Run the container:

    Local:

        ./run.sh --run

    or run the container on the platform of your choice.
