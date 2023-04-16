// makedb.q
// Generate a sample database

/- set seed value
/\S -314159i

// Params
.db.syms:`NOK`YHOO`CSCO`ORCL`AAPL`DELL`IBM`MSFT`GOOG;
.db.srcs:`N`O`L;
.db.curr:.db.syms!`EUR`USD`USD`USD`USD`GBP`USD`USD`USD;
.db.starttime:08:00:00.0;
.db.hoursinday:08:30:00.0;
/- initial prices
.db.initpxs:.db.syms!20f+count[.db.syms]?30f;

/- database initialisation
.db.numQuotes:10000;
.db.numTrades:2000;
.db.dbDate:.z.D;

// Schema
.db.initSchema:{[]
 quotes::([]time:`timestamp$();sym:`g#`$();src:`g#`$();bid:`float$();ask:`float$();bsize:`int$();asize:`int$());
 trades::([]time:`timestamp$();sym:`g#`$();src:`g#`$();side:`g#`$();price:`float$();size:`int$());
 }

// Utility Functions
.db.rnd:{0.01*floor 100*x};
.db.rFill:{reverse fills reverse x};

// Create simple database
.db.makedb:{[nq;nt;dt]
  /- quotes generation
  qts:([]time:`#asc .db.starttime+nq?.db.hoursinday;sym:`g#nq?.db.syms;src:`g#nq?.db.srcs;bid:0.0005*-1+nq?2f);
  qts:update bid:.db.initpxs[sym]*exp(sums;bid)fby sym from qts;
  qts:update bid:.db.rnd bid-nq?0.03,ask:.db.rnd bid+nq?0.03,bsize:500*1+nq?20,asize:500*1+nq?20 from qts;
  /- trades generation
  trds:([]time:`#asc .db.starttime+nt?.db.hoursinday;sym:nt?.db.syms;src:nt?.db.srcs;side:nt?`buy`sell);
  trds:aj[`sym`time;trds;qts];
  trds:![trds;();{x!x}(),`sym;{x!`.db.rFill,'x}`bid`ask`bsize`asize];
  trds:select time,sym,src,side,price:?[side=`buy;ask;bid],size:`int$(nt?1f)*?[side=`buy;asize;bsize] from trds;
  /- save tables
  .db.initSchema[];
  upsert[`quotes;update time:`timestamp$time+dt from qts];
  upsert[`trades;update time:`timestamp$time+dt from trds];
  /- log table creation
  -1"Created quotes table of count ",string[count quotes]," and trades table of count ",string[count trades],".";
  -1"Type 'quotes' or 'trades' to view each table.\n";
  };

/- initialise the database
.db.makedb[.db.numQuotes;.db.numTrades;.db.dbDate];
