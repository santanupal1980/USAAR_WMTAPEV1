# USAAR_WMTAPEV1
This is an automatic statistical post editing system, It extract word alignment from METEOR based confusion network and it is also giving Hybrid monolingual word alignments (HybridAlignment.java) (USAAR-SAPE: An English–Spanish Statistical Automatic Post-Editing System) . The repository also contains a java code which extract features from TER tool from a given MT output and the corresponding post editing version (runTer.java and FeatureExtraction.java). 
The repository also contain some evaluation code e.g. sentenceBLEU.java and F1measure.java for a given a given MT output and the corresponding post editing version.

# please cite this paper:

@InProceedings{pal-EtAl:2015:WMT,
  author    = {Pal, Santanu  and  Vela, Mihaela  and  Naskar, Sudip Kumar  and  van Genabith, Josef},
  title     = {USAAR-SAPE: An English--Spanish Statistical Automatic Post-Editing System},
  booktitle = {Proceedings of the Tenth Workshop on Statistical Machine Translation},
  month     = {September},
  year      = {2015},
  address   = {Lisbon, Portugal},
  publisher = {Association for Computational Linguistics},
  pages     = {216--221},
  url       = {http://aclweb.org/anthology/W15-3026}
}
