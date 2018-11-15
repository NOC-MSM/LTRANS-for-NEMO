  CASE(5) !NEMO depths from e3t=T-cell thickness
           usv=bathy(ele,1:4) !ISSUE!!!!
            mus= MAXVAL(usv)

        do b=1,mus
	    E30 = getInterp("E3T0e",b) !NEMO
 	    E30w = getInterp("E3W0e",b)
 	    E3T(b) = E30*(1.0 + zeta/h) 
            E3W(b) = E30w*( 1.0 + zeta/h )
	enddo

            dept(1)=0.5*E3W(1)
            depw(1)=0.0
          
           do a=2,mus
              dept(a) = dept(a-1) + E3W(a)
              depw(a) = depw(a-1) + E3T(a-1)
	   enddo
	do a=1,mus !Flip over NEMO
        fdepw(a)=depw((mus+1)-a)
	enddo
     
        getWlevel = DBLE(-1.0) * fdepw(i)
