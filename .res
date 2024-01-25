#!/bin/bash

if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# MME55 - Metalloenzyme model reaction energies and barrier heights, J. Chem. Theory Comput. 2023, 19, 22, 8365–8383, DOI: https://doi.org/10.1021/acs.jctc.3c00558

# reference level:
# DLPNO-CCSD(T1)/TightPNO/CBS(def2-TZVPP/def2-QZVPP) for singlet reaction energies of CDO, NiSOD, and Hc
# 'estimated T1' for triplet states of NiSOD and Hc: E = E_{DLPNO-CCSD(T0)}^{CBS} + Δ(T)/TZ, with  Δ(T) = [ E(T1) - E(T0) ]
# For Co-NHase 'estimated TightPNO' approach: CPS extrapolation E_{corr} = E_{corr}^5 + 1.5*(E_{corr}^6 - E_{corr}^5), with E_{corr}^X and T_{CutPNO} = 10^{-X} for DLPNO-CCSD(T1)
# all other references are 'estimated CBS(3,4)': E = E_{SCF}^{CBS} + E_{corr,DLPNO-CCSD}^{CBS} + E^{TZ}_{T1}
# see publication for additional details

#DMML - (2R,3S)-Dimethylmalate lyase [Mn]
$tmer {DMML_REACT,DMML_INT1}/$f x -1 1 $w -0.847 
$tmer {DMML_INT2,DMML_PROD1}/$f x -1 1 $w 24.144 
$tmer {DMML_INT2,DMML_INT3}/$f x -1 1 $w 65.056 
$tmer {DMML_INT3,DMML_INT4}/$f x -1 1 $w -9.166 
$tmer {DMML_INT4,DMML_PROD1}/$f x -1 1 $w -31.746 
#CDO - Cysteine dioxygenase [Fe]
$tmer {CDO_1A,CDO_1B}/$f x -1 1 $w -1.168
$tmer {CDO_1B,CDO_1C}/$f x -1 1 $w -52.083
$tmer {CDO_3A,CDO_3B}/$f x -1 1 $w -2.643
$tmer {CDO_3Cprime,CDO_3D}/$f x -1 1 $w -77.322
$tmer {CDO_5A,CDO_5B}/$f x -1 1 $w -43.307
$tmer {CDO_5B,CDO_5C}/$f x -1 1 $w -67.762
$tmer {CDO_5C,CDO_5Cprime}/$f x -1 1 $w -10.277
$tmer {CDO_5Cprime,CDO_5D}/$f x -1 1 $w -1.082
#Co-NHase - Nitrile hydratase [Co]
$tmer {CoNHase_ES,CoNHase_INT1}/$f x -1 1 $w 28.103
$tmer {CoNHase_INT1,CoNHase_INT2}/$f x -1 1 $w  -27.574
$tmer {CoNHase_INT2,CoNHase_EP}/$f x -1 1 $w  8.371
#NiSOD - Superoxide dismutase [Ni]
$tmer {NiSOD_4_singlet,NiSOD_4prime_singlet}/$f x -1 1 $w 8.043
$tmer {NiSOD_4_triplet,NiSOD_4prime_triplet}/$f x -1 1 $w 25.440
$tmer {NiSOD_4_triplet,NiSOD_TS4}/$f x -1 1 $w 27.773
$tmer {NiSOD_4prime_triplet,NiSOD_TS4}/$f x -1 1 $w 2.333
#Hc - Hemocyanin [Cu]
$tmer {Hc_1_1,Hc_1_2a}/$f x -1 1 $w -26.506 
$tmer {Hc_1_2a,Hc_1_3}/$f x -1 1 $w -9.933
$tmer {Hc_3_1,Hc_3_2a}/$f x -1 1 $w 6.954
$tmer {Hc_3_2a,Hc_3_3}/$f x -1 1 $w -6.035
$tmer {Hc_3_1,Hc_3_TS1}/$f x -1 1 $w 5.229
$tmer {Hc_3_2a,Hc_3_TS2}/$f x -1 1 $w 4.165
#AAP - Aminopeptidase [Zn]
$tmer {AAP_int1a,AAP_int1b}/$f x -1 1 $w  4.139 
$tmer {AAP_int1b,AAP_int2}/$f x -1 1 $w  0.723
$tmer {AAP_int2,AAP_int3}/$f x -1 1 $w  0.739
$tmer {AAP_int3,AAP_p}/$f x -1 1 $w  -3.412
$tmer {AAP_r,AAP_ts1}/$f x -1 1 $w  8.797
$tmer {AAP_int1b,AAP_ts2}/$f x -1 1 $w  2.339
$tmer {AAP_int2,AAP_ts3}/$f x -1 1 $w  1.706
$tmer {AAP_ts3,AAP_ts4}/$f x -1 1 $w  1.483
#PTE - Phosphotriesterase [Zn]
$tmer {PTE_r,PTE_i}/$f x -1 1 $w 2.492 
$tmer {PTE_r,PTE_ts1}/$f x -1 1 $w  6.652
$tmer {PTE_i,PTE_ts2}/$f x -1 1 $w  8.302
#AH - Acetylene hydratase [W]
$tmer {AH_r,AH_int1}/$f x -1 1 $w  -8.459
$tmer {AH_int1,AH_int2}/$f x -1 1 $w  9.954
$tmer {AH_int2,AH_int3}/$f x -1 1 $w  -22.538
$tmer {AH_int3,AH_int4}/$f x -1 1 $w -2.685 
$tmer {AH_int4,AH_p}/$f x -1 1 $w  -3.418
$tmer {AH_int1,AH_ts1}/$f x -1 1 $w  16.709
$tmer {AH_int2,AH_ts2}/$f x -1 1 $w  14.660
$tmer {AH_int3,AH_ts3}/$f x -1 1 $w 8.501 
$tmer {AH_int4,AH_ts4}/$f x -1 1 $w 17.105 
#W-FOR - Formaldehyde ferredoxin oxidoreductase [W]
$tmer {WFOR_r,WFOR_int}/$f x -1 1 $w  -3.210
$tmer {WFOR_int,WFOR_p}/$f x -1 1 $w  -14.939
$tmer {WFOR_r,WFOR_ts1}/$f x -1 1 $w  14.272
$tmer {WFOR_int,WFOR_ts2}/$f x -1 1 $w 19.699 
#Mo-Cu CODH - Carbon monoxide dehydrogenase [MoCu]
$tmer {MoCuCODH_Int1A,MoCuCODH_Int2A}/$f x -1 1 $w 10.721 
$tmer {MoCuCODH_Int2A,MoCuCODH_Int3A}/$f x -1 1 $w -5.793 
$tmer {MoCuCODH_Int3A,MoCuCODH_Int4A}/$f x -1 1 $w -2.630 
$tmer {MoCuCODH_Int3A,MoCuCODH_Int5A}/$f x -1 1 $w 5.881 
$tmer {MoCuCODH_Int5A,MoCuCODH_Int6A}/$f x -1 1 $w 1.800 





