---
layout: post
category: post
published: false
title: "Introduction to WebRTC, from a BSD sockets background"

category: guide
tag: tech
---
Firstly createOffer generates an SDP blob, otherwise known as an RTCSessionDescription. This blob specifies the supported configurations (full set of capabilities) for the session. This blob is to be sent to the node for processing via a signalling channel.

When the node receives this offer, they use **createAnswer** to generate an SDP answer with the supported configuration for the session that is compatible with the parameters in the remote configuration (the received offer).

setLocalDescription: as local description. 
setRemoteDescription: apply the supplied RTCSessionDescription as the remote offer or answer. 

to connect to a specific host, we use the ICE interface. 
[addIceCandidate](http://dev.w3.org/2011/webrtc/editor/webrtc.html#widl-RTCPeerConnection-addIceCandidate-void-RTCIceCandidate-candidate)
eg. candidate:1 1 UDP 1694498815 192.0.2.33 10000 typ host
	https://tools.ietf.org/html/draft-ietf-rtcweb-jsep-03#section-3.4.1.1
takes a candidate in the format defined https://tools.ietf.org/html/rfc5245#section-15.1

https://code.google.com/p/webrtc-samples/source/browse/trunk/apprtc/index.html


