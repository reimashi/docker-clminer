#!/bin/bash

if  [ ! -f libs.tar.gz ]; then
	# Check if the dir is correct. This is valid for ubuntu 16.04 and official amdgpu-pro drivers
	ln -s /opt/amdgpu-pro/lib/x86_64-linux-gnu ./amdgpu-pro
	tar -czvf libs.tar.gz amdgpu-pro/*
	rm ./amdgpu-pro
fi

if  [ ! -f libs.tar.gz ]; then
	ln -s /etc/OpenCL .
	tar -czvf conf.tar.gz OpenCL/*
	rm ./OpenCL
fi

docker build -t reimashi/claymore_eth: .
