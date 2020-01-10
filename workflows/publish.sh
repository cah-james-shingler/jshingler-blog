name: GitHub Pages

on:
  push:
    branches:
    - master

jobs:
  build-deploy:
    runs-on: ubuntu-18.04
    steps:
    - uses: actions/checkout@v1
      with:
        submodules: true

    - name: Install Ruby Dev
      run: sudo apt-get install ruby-dev

    - name: Install AsciiDoctor and Rouge
      run: sudo gem install asciidoctor rouge

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: '0.62.0'

    - name: Build
      run: hugo

    # - name: Deploy
    #   uses: peaceiris/actions-gh-pages@v2
    #   env:
    #     ACTIONS_DEPLOY_KEY: ${{ secrets.ACTIONS_DEPLOY_KEY }}
    #     PUBLISH_BRANCH: gh-pages
    #     PUBLISH_DIR: ./public
