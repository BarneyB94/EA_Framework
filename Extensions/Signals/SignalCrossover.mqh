//+------------------------------------------------------------------+
//|                                              SignalCrossover.mqh |
//|                                               Alekzander Bywater |
//|                                     https://github.com/BarneyB94 |
//+------------------------------------------------------------------+
 
#include	"../../Framework.mqh"

class CSignalCrossover : public CSignalBase {

private:

protected:	// member variables

	int				mIndex1;
	int				mIndex2;
	
public:	// constructors

	CSignalCrossover(string symbol, ENUM_TIMEFRAMES timeframe,
								int index1=1, int index2=2)
								:	CSignalBase(symbol, timeframe)
								{	Init(index1, index2);	}
	CSignalCrossover(int index1=1, int index2=2)
								:	CSignalBase()
								{	Init(index1, index2);	}
	~CSignalCrossover()	{	}
	
	int			Init(int index1, int index2);

public:

	virtual void								UpdateSignal();

};

int		CSignalCrossover::Init(int index1, int index2) {

	if (InitResult()!=INIT_SUCCEEDED)	return(InitResult());

	mIndex1			=	index1;
	mIndex2			=	index2;
			
	return(INIT_SUCCEEDED);
	
}

void		CSignalCrossover::UpdateSignal() {

	double	fast1	=	GetIndicatorData(0, mIndex1);
	double	fast2	=	GetIndicatorData(0, mIndex2);
	double	slow1	=	GetIndicatorData(1, mIndex1);
	double	slow2	=	GetIndicatorData(1, mIndex2);

	//	There is a less common condition where the fast
	//		indicator touches the slow indicator and then
	//		reverses. With the conditions below this would
	//		appear like a cross.	
	if ( (fast1>slow1) && !(fast2>slow2) ) {	//	Crossed up
		mEntrySignal	=	NWN_SIGNAL_BUY;
		mExitSignal		=	NWN_SIGNAL_SELL;
	} else
	if ( (fast1<slow1) && !(fast2<slow2) ) {	//	Crossed down
		mEntrySignal	=	NWN_SIGNAL_SELL;
		mExitSignal		=	NWN_SIGNAL_BUY;
	} else {
		mEntrySignal	=	NWN_SIGNAL_NONE;
		mExitSignal		=	NWN_SIGNAL_NONE;
	}

	return;
	
}

	
