---
template: post
title: networks notes
slug: networks
date: "2020-05-03T12:00:00.121Z"
category: basics 
tags: ["basics"]
---

# Network Basics

These are notes based from H.M. Deitel's "Operating Systems" 2nd Edition copyright 1990

## Networking Standards

### History

The first computer networks were for telephones. To make the network operate among different companies, reginal governments and equipment manufacturers there emerged a concept called consensus standrds for interfaces.

For standards to be useful they must be freely available and not give advantage to a particular adopter. The advantage of creating standards is largely economic.

The main standards organizations (as of 1990) are ITT and CCITT.

ITT = International Organization for Standardization 
CCITT = International Telegraph and Telephone Consultative Committee

(translated from French)

In the US, the main one is ANSI = American National Standards Institute.

Has committees: X3 for computes and T1 for telecommunications.

Other organizations:
Electronic Industries Association: EIA
Institute for Electrical and Electronics Engineers: IEEE
National Institute for Standards and Technology: NIST

### Types of Standards

**Architectural Standards** define the context in which more specific standards are written

**Base Standards** define services and protocols at the layers defined by architectural standards

**Functional Standards** also called international standardized profiles define the options to be used in implementing protocols in specific contexts.

**Conformance Standards** define tests and procedures for verifying that service and protocol implementations match the relevant standards specifications.

## Network Architecture

**OSI Reference Model** is an arbitrary, hierarchical decomposition of computer communications functions into seven levels of abstraction called **layers**. **Layers** have conceptual functions, that may be implemented in various ways.

OSI does not have 1 protocol per layer. It has many protocols for implementing the layers. For example the **physical layer** can involve many different types of cables to accomplish the same function.

**SNA** is IBM's proprietary network architecture, Systems Network Architecture. It's a layered architecture but favors master/standby instead of peer to peer like OSI.

### Layering

Layers are realized through **service** and **protocol** definitions. The implementation of layer n is an n-entity.

The calling layer above an n-entity is an (n+1)-entity and is the n-service user.

The lay below layer n, from which the n-entity requests services, is an (n-1)-entity.

This is basically just an interface. Service n stands between n-1 and n+1 and provides services to n+1 which may or may not include services from n-1.

**service interfaces** are not defined by the OSI. This is good because APIs designed in the 50s would probably not be very intuitive. These interfaces and how they are broken into cpu processes and system calls is basically what I build as a full stack web developer.

Protocol syntax needs to be standardized but service syntax does not need to be. As long as services can communicate then the network is functioning. The details of the communication are up to the specific implementation of those services.

### Protocol Data Units and Service Data Units

OSI says that n-entities communicate using an (n-1)-connection between (n-1)-entities. The entities exchange n-protocol-control-information to facilitate sending of n-user-data. The combination of protocol and user data is a **Protocol Data Unit**. PDU syntax is thoroughly specified by OSI.

When an entity sends n-interface-data to an (n-1)-entity it forms a **Service Data Unit** or SDU.

This is crazy to follow but...

An (n-1)-entity is used to send n-SDUs through the network so an (n-1)-entity normally builds a PDU in response to a service request by wrapping its own protocol headers and trailers around a representation of the n-SDU.

What does this mean? I'm not sure what a representation of the SDU means. I think this means that (n-1)-entities (lower layers) wrap the SDUs they send on down to lower layers in their own SDUs, and nest them. It goes on to say that when a lower layer receives these requests, it strips the SDUs at its own layer. Thus, this will only nest twice in this example.

These units seem very abstract. And, it's important to remember, these layers are talking about physical connections, data links, session, transport, etc... so this is not talking about a server trying to process requests.

Rereading the above notes I think all this is saying is that PDUs only concern n-connections and are only used to carry SDUs across layers. Then PDUs are stripped.


