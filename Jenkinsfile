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
                    test -f /home/gayatri/openwrt/Makefile
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

        stage('Find IPK') {
            steps {
                sh '''
                    echo "Searching for generated IPK..."

                    find /home/gayatri/openwrt/bin/packages \
                        -name "*test_project*.ipk" \
                        -o -name "*testproject*.ipk"
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    echo "Running basic package test..."

                    find /home/gayatri/openwrt/bin/packages \
                        -name "*test_project*.ipk" \
                        -o -name "*testproject*.ipk" | grep .
                '''
            }
        }
    }
}


