      program rho_od_z
      implicit integer (a-z)

      parameter (nfrmax=10000,nslmax=1000)
      parameter (natmax=300000)
      parameter (ngrmax=20,natgrmax=1000)


      character*80 line
      character*30 nazwaXYZ(ngrmax),nazwaOUT,tempchar,listaXYZ,grDATA
      double precision rho(nslmax,ngrmax),z(nslmax),zmin,zmax,
     1                 mass(natgrmax,ngrmax),wsp(natmax,3,nfrmax),
     2                 masal(natmax)
      integer natgr(ngrmax),atlicz(nslmax)
      double precision grub,tempdub,lx,ly,vol
      character*20 fmt


      i=iargc()
      if(i.eq.6) then
       call getarg(1,listaXYZ)
       call getarg(2,nazwaOUT)
       call getarg(3,grDATA)
       call getarg(4,tempchar)
       read(tempchar,*) nsl
       call getarg(5,tempchar)
       read(tempchar,*) zmin
       call getarg(6,tempchar)
       read(tempchar,*) zmax
      else
       write(*,*) 'podaj plik z lista inputow, output'
       write(*,*) 'plik z danymi grup, nslabs, zmin i zmax'
       stop ' '
      endif


      open(99,file=listaXYZ)
      i=1
      do
        read(99,'(a30)',end=99) nazwaXYZ(i)
        i=i+1
      enddo
99    continue
      close(99)
      ngr=i-1


      open(98,file=grDATA)
      do i=1,ngr
        read(98,*) natgr(i)
        read(98,*) (mass(j,i),j=1,natgr(i))
      enddo
98    continue
      close(98)

      z(1)=zmin
      grub=(zmax-zmin)/nsl
      do i=2,nsl+1
        z(i)=z(i-1)+grub
      enddo
      write(*,
     1 '("Z od",f8.1," do:",f8.1,",co",f4.1,"[A], tj.",i4," przedz")')
     2  z(1),z(nsl+1),grub,nsl

        

      do gr=1,ngr

        do i=1,nsl
         rho(i,gr)=0.0
        enddo

        tempchar=nazwaXYZ(gr)
        open(10,file=tempchar)
        fr=1
        do
         read(10,'(a80)',end=10) line
         k=index(line,'klatka')
         if(k.ne.0) then
           read(line,*) tempchar,tempchar,tempchar,nat,lx,ly
           do i=1,nat
            read(10,*) (wsp(i,j,fr),j=1,3)
           enddo
           fr=fr+1
         endif
        enddo
10      continue
        close(10)
        nfr=fr-1

        
       
        nmol=nat/natgr(gr)
        write(*,'("Plik:",a20,i5," klatek po ",i10," at")')
     1        nazwaXYZ(gr), nfr,nat
        write(*,'("Dla ",i5," at. w grupie to daje ",i5," grup")')
     1        natgr(gr),nmol
        

        pos=0
        do i=1,nmol
          do j=1,natgr(gr)
            masal(pos+j)=mass(j,gr)
          enddo
          pos=pos+natgr(gr)
        enddo

        vol=lx*ly*grub


        do i=1,nsl
         atlicz(i)=0
        enddo

        do fr=1,nfr
         do i=1,nsl
          do j=1,nat
           if(wsp(j,3,fr).gt.z(i).and.wsp(j,3,fr).lt.z(i+1)) then
             atlicz(i)=atlicz(i)+1
             rho(i,gr)=rho(i,gr)+masal(j)
           endif
          enddo
         enddo
        enddo


        do i=1,nsl
          rho(i,gr)=rho(i,gr)/(vol*nfr)
c         write(*,'(f10.1,i10)') z(i),atlicz(i)
        enddo

      enddo

      open(20,file=nazwaOUT)
      do i=1,ngr
        write(20,'(i5,4x,a30)') i, nazwaXYZ(i)
      enddo
      fmt='(10x,   i10)'
      write(fmt(6:8),'(i3)') ngr
      write(20,fmt) (i,i=1,ngr)
      fmt='(f10.2,   f10.4)'
      write(fmt(8:10),'(i3)') ngr
      do i=1,nsl+1
        write(20,fmt) z(i),(rho(i,j),j=1,ngr)
      enddo


      close(20)


      end
