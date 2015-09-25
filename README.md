# Kafka manager [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)][LICENSE]

[LICENSE]: /LICENSE


This is sample project to try [kafka-manager](https://github.com/yahoo/kafka-manager)

## Build

To build image

```bash
$ docker build -t tcnksm/kafka-manager .
```

## Usage

To play with kafka-manager, it's better to have kafka. It's easy to use [tcnksm/single-kafka](https://github.com/tcnksm/dockerfile-single-kafka). You can run it by the following command,

```bash
$ ./script/kafka.sh
```

Then run kafka-manager,

```bash
$ ./script/kafka-manager.sh
```

## Author

[Taichi Nakashima](https://github.com/tcnksm)
