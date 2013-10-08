network-backbone-toolkit
========================

## DESCRIPTION
 This site offer the 'network backbones' set extraction codes.

 The brain performs diverse functions in parallel, and brain functions' change leads different states of brain. Numerous studies have used static techniques to analyze brain networks in different brain states. However, there has been relatively little study of dynamic network properties as states evolve over time. Here, we describe the analysis of dynamic “network backbones” that reflect the evolution of brain networks during behavioral state transitions. We hypothesized that the global dynamic network of the brain results from the superposition of many network backbones, which may correspond to a basic functional circuit in the brain. In our study, we demonstrated the dynamic network backbones using general anesthesia that is useful tool to modulate the consciousness level. We extracted the "backbones" of dynamic networks, which are the mostly appeared subgraphs through temporal evolution in a certain state. Dynamic network backbones demonstrated two different attributes: ‘constitutive backbones’ which persist during behavioral state transitions, and ‘variable backbones’ that change in association with state transitions. Dynamic network backbones capture both stable and variable networks in the transition across brain states, as modeled by induction of and emergence from general anesthesia. We suggest that the brain state can be described not only as a static network, but also as a composite picture of dynamic backbones and their changes.
 
[Our paper](http://www.plosone.org/article/info3Adoi2F10.13712Fjournal.pone.0070899) describes more detailed information.
Currently, we offer MATLAB® code with basic example. More languages and examples are coming soon.

## HISTORY
 * Sep. 18, 2012
  * (first version). MATLAB© version. This version is basic conversion from python/C code. No optimization is applied.

## REQUIREMENTS
 * MATLAB©
   * Version 7.0 or higher

## INSTALLATION
 * Put the attached .m files into your MATLAB© path.
 
## DOCUMENTATION

    NETWORKBACKBONES         Network backbones with n links.
          NETWORKBACKBONES(NS,n) extracts n-link sized dynamical network backbones from
          network series NS.
    
          NETWORKBACKBONES(NS,n,k) extracts top-k n-link sized dynamical
          network backbones from network series NS.
    
          NETWORKBACKBONES(NS,n,[kmin kmin]) extracts top-(kmin~kmax) n-link sized dynamical network backbones from network series NS.
    
          NETWORKBACKBONES(NS,n,k,threshold) extracts top-k n-link sized dynamical network backbones from network series NS with threshold occupation probability.
    
          NETWORKBACKBONES(NS,n,k,threshold,directed) extracts top-k n-link sized dynamcial network backbones from network series NS with threshold occupation probability from directed network. (if directed = true)
    
          Output:     B       Network backbones (struct containing adjacency matrix)
                      p       Occupation probability of network backbones (vector)
    
          Example
            [B p] = networkbackbones(NS,n)
    
          See also LINKPAIRPROB
    
          Created Sep 18, 2012
          This MATLAB code is ported from python version.
          Jeongkyu Shin <inureyes@gmail.com>


## REFERENCE
Please refer [this paper](http://www.plosone.org/article/info3Adoi2F10.13712Fjournal.pone.0070899) when you use the code. You can also download citations via [this link](http://www.plosone.org/article/citationList.action?articleURI=info3Adoi2F10.13712Fjournal.pone.0070899).

