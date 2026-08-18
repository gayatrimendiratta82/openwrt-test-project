pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out project...'
            }
        }

        stage('Check OpenWrt') {
            steps {
                sh '''
                    echo "Checking OpenWrt source..."

                    if [ ! -f /home/gayatri/openwrt/Makefile ]; then
                        echo "ERROR: OpenWrt source not found!"
                        exit 1
                    fi

                    echo "OpenWrt source found."
                '''
            }
        }

        stage('Build OpenWrt Package') {
            steps {
                sh '''
                    cd /home/gayatri/openwrt

                    echo "Building test_project..."

                    make package/test_project/compile V=s
                '''
            }
        }

        stage('Find Package') {
            steps {
                sh '''
                    echo "Searching for generated package..."

                    PACKAGE=$(find /home/gayatri/openwrt/bin/packages \
                        -type f \
                        -name "*test_project*.apk" \
                        | head -n 1)

                    if [ -z "$PACKAGE" ]; then
                        echo "ERROR: Package not found!"
                        exit 1
                    fi

                    echo "Package found:"
                    echo "$PACKAGE"

                    echo "Package details:"
                    ls -lh "$PACKAGE"
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    echo "Running basic package test..."

                    PACKAGE=$(find /home/gayatri/openwrt/bin/packages \
                        -type f \
                        -name "*test_project*.apk" \
                        | head -n 1)

                    if [ -z "$PACKAGE" ]; then
                        echo "ERROR: Package not found!"
                        exit 1
                    fi

                    echo "Testing package:"
                    echo "$PACKAGE"

                    if [ ! -f "$PACKAGE" ]; then
                        echo "ERROR: Package file does not exist!"
                        exit 1
                    fi

                    echo "Package exists."

                    echo "Package size:"
                    ls -lh "$PACKAGE"

                    echo "Package test successful."
                '''
            }
        }
    }

    post {
        success {
            echo '========================================='
            echo ' OpenWrt Package Build SUCCESSFUL'
            echo '========================================='
        }

        failure {
            echo '========================================='
            echo ' OpenWrt Package Build FAILED'
            echo '========================================='
        }
    }
}
