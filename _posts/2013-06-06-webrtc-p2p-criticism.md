---
layout: post
title: WebRTC is not true peer-to-peer
---
<p class='lead'>Why should you care? Because, we are hindering exciting innovation in browser-based P2P, that which might provide magnificently simple solutions to problems such as <a href="https://xkcd.com/949/" title="relevant xkcd">sharing documents</a></p>

*In short:* WebRTC renders the bootstrapping process of peer-to-peer applications (wherein you join the network by initially connecting to a node and asking them for peers) unusable because the initial connection set-up is dependent on **centralised** servers.

I think very highly of WebRTC as a platform for a range of cool new innovations, but it is wrong to give it the status of supporting peer-to-peer (P2P) network models.

I'm writing this post as both a **criticism** of the current API and a **plea** for a solution to be adopted (as the APIs are still in development).  

### Problem
The current issue which is hindering my efforts to create a decentralised P2P web application, is the **centralised** nature of the initial connection set-up — this process is called **signalling**. In a typical P2P application, you join the network through asking a node for peers, a process known as bootstrapping. This is rendered impossible in WebRTC because to connect to a node you need to engage in signalling, which is centralised. 

RTCPeerConnection is the interface whereby peers (browsers) may connect to each other. To initially set-up a connection, peers do two things:
1. Firstly they exchange network information (network interfaces and ports) using the ICE framework.[^addIceCandidate]
2. Secondly, they negotiate a set of configurations for that session, using an offer/answer based protocol.[^createOffer] These configurations are stored as RTCSessionDescription objects.[^sdpBlob]

Both of these steps require a **signalling channel**. My question is why?

### Solutions
You could write a terrible hack to make use of IRC web chat or anonymous XMPP servers to exchange signalling information. It wouldn't be ethical or appropriate to rely on Wikileaks' web IRC for decentralised signalling, so there must be an alternative.

Another idea is to set-up a public signalling server. We already have public servers available for STUN (as provided by Google and Mozilla), which is the mechanism for traversing NAT. So why don't we have them for signalling? Because they can be abused and again it is unreliable to rely on a third-party, which is the basis of this issue. 

But the only real solution is **changing the WebRTC API to suit us**, so we could do do signalling by directly communicating with the other peer. I've looked into this and it [isn't possible](http://stackoverflow.com/questions/16954585/is-it-possible-to-directly-connect-using-ice-and-then-do-direct-peer-to-peer-sig) right now, but I think it should be. 

### Conclusion
I don't claim to have all the answers — if someone knows how to achieve this, and refutes what I have said, then great! Until then, **something needs to be done**.

[^addIceCandidate]: the WebRTC API has few tutorials for people coming from a BSD sockets background, but basically how this works is you use the [addIceCandidate](http://www.w3.org/TR/webrtc/#widl-RTCPeerConnection-addIceCandidate-void-RTCIceCandidate-candidate) function to add a remote endpoint (RTCIceCandidate object) for the peer you will be connecting to.
[^createOffer]: see the [createAnswer](http://dev.w3.org/2011/webrtc/editor/webrtc.html#widl-RTCPeerConnection-createOffer-void-RTCSessionDescriptionCallback-successCallback-RTCPeerConnectionErrorCallback-failureCallback-MediaConstraints-constraints) documentation
[^sdpBlob]: RTCSessionDescription is just a wrapper for an [SDP Blob](https://en.wikipedia.org/wiki/Session_Description_Protocol), which is a really simple text-based format.
