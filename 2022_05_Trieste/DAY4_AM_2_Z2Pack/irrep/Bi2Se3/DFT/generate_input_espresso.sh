# SCF input file for Quantum Espresso
cat > scf.in << EOF
&CONTROL
   calculation     =  'scf',
   prefix          =  'bi2se3',
   pseudo_dir = '$PSEUDO_DIR',
   outdir='$OUT_DIR',
   restart_mode    =  'from_scratch',
   disk_io         = 'nowf'
 /

 &SYSTEM
   ibrav           =  0,
   A               =  1.0,
   degauss         =  0.0001,
   ecutwfc         =  33.09,
   nat             =  5,
   ntyp            =  2,
   occupations     =  'smearing',
   smearing        =  'mv',
   lspinorb        = .TRUE.
   noncolin        = .TRUE.
 /

 &ELECTRONS
   mixing_beta = 0.3,
   conv_thr    = 1e-8,
 /

CELL_PARAMETERS alat
     2.0714999999999995    1.1959810826263095    9.5453333333333319
    -2.0714999999999995    1.1959810826263095    9.5453333333333319
     0.0000000000000000   -2.3919621652526191    9.5453333333333319

ATOMIC_SPECIES
  Bi 209  Bi.upf
  Se 79   Se.upf

ATOMIC_POSITIONS crystal
Bi  0.6014999999999998  0.6014999999999999  0.6014999999999999
Bi  0.3985000000000000  0.3985000000000001  0.3984999999999999
Se  0.0000000000000000  0.0000000000000000  0.0000000000000000
Se  0.7885000000000000  0.7885000000000000  0.7885000000000000
Se  0.2114999999999999  0.2114999999999999  0.2114999999999999

K_POINTS automatic
  5   5   5   0   0   0
EOF

# BANDS input file for Quantum Espresso
cat > bands.in << EOF
&CONTROL
   calculation     =  'bands',
   prefix          =  'bi2se3',
   pseudo_dir = '$PSEUDO_DIR',
   outdir='$OUT_DIR',
   restart_mode    =  'from_scratch',
   disk_io         = 'medium'
 /

 &SYSTEM
   ibrav           =  0,
   A               =  1.0,
   degauss         =  0.0001,
   ecutwfc         =  33.09,
   nat             =  5,
   ntyp            =  2,
   occupations     =  'smearing',
   smearing        =  'mv',
   lspinorb        = .TRUE.
   noncolin        = .TRUE.
 /

 &ELECTRONS
   mixing_beta = 0.3,
   conv_thr    = 1e-8,
 /

CELL_PARAMETERS alat
     2.0714999999999995    1.1959810826263095    9.5453333333333319
    -2.0714999999999995    1.1959810826263095    9.5453333333333319
     0.0000000000000000   -2.3919621652526191    9.5453333333333319

ATOMIC_SPECIES
  Bi 209  Bi.upf
  Se 79   Se.upf

ATOMIC_POSITIONS crystal
Bi  0.6014999999999998  0.6014999999999999  0.6014999999999999
Bi  0.3985000000000000  0.3985000000000001  0.3984999999999999
Se  0.0000000000000000  0.0000000000000000  0.0000000000000000
Se  0.7885000000000000  0.7885000000000000  0.7885000000000000
Se  0.2114999999999999  0.2114999999999999  0.2114999999999999

K_POINTS crystal_b
5
0.50 0.50 0.00 15 ! F
0.00 0.00 0.00 15 ! G
0.00 0.50 0.00 15 ! L
0.50 0.50 0.50 15 ! T
0.00 0.00 0.00 15 ! G
EOF

# post-processing of bands with bands.x
cat > pp.bands.in << EOF
&bands
   outdir='$OUT_DIR',
   prefix          =  'bi2se3',
   filband         = 'bi2se3.bands.dat'
/
EOF

