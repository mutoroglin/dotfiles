#!/bin/bash

case $1 in
    volume) eww update volume-polling=true
            eww open volume
            sleep 2
            eww close volume
            eww update volume-polling=false
            ;;
    brightness) eww update brightness-polling=true
            eww open brightness
            sleep 2
            eww close brightness
            eww update brightness-polling=false
            ;;
    mic) eww update mic-polling=true
            eww open mic
            sleep 2
            eww close mic
            eww update mic-polling=false
            ;;
    *) ;;
esac
