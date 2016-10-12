Particle[] pGroup;
void setup()
{
	size(900,900);
	pGroup = new Particle[300];
	for (int i = 0; i<pGroup.length; i++)
	{
		int q = 3;
		pGroup[i] = new NormalParticle();
	}
	pGroup[0] = new OddballParticle();
	pGroup[1] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i<pGroup.length; i++)
	{
		pGroup[i].show();
		pGroup[i].move();
	}
}
class NormalParticle implements Particle
{
	double mX, mY, mTheta, mSpeed;
	NormalParticle()
	{
		mX = 450;
		mY = 450;
		mTheta = Math.random()*10+15;
		mSpeed = Math.PI*2*Math.random()+2;
	}
	void show()
	{
		fill(102,0,204);
		ellipse ((int)mX, (int)mY, 20, 20);
	}
	void move()
	{
		mTheta += 0.01;
		mX += Math.cos(mTheta)*mSpeed;
		mY += Math.sin(mTheta)*mSpeed;
	}
}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle 
{
	double mX, mY, mTheta, mSpeed;
	OddballParticle()
	{
		mX = Math.random()*400+200;
		mY = Math.random()*400+200;
		mTheta = Math.random()*10;
		mSpeed = Math.PI*5*Math.random();
	}
	public void show()
	{
		rect((int)mX, (int)mY, 50, 50);
	}
	public void move()
	{
		mTheta += 0.5;
		mX += Math.cos(mTheta)*mSpeed;
		mX += 1;
		if (mX>800)
		{
			mX=Math.random()*800;
		}
		mY += Math.sin(mTheta)*mSpeed;
		mY += 1;
		if (mY>800)
		{
			mY=Math.random()*800;
		}
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		fill(204,0,204);
		ellipse((int)mX, (int)mY, 50, 50);
	}
}


