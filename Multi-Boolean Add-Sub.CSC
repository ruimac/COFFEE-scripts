QC4Dscrp  :�   :� ��     ��              �   ���� US   �   �   ����      ��   " M u l t i - B o o l e a n   A d d  �   ��  � m a i n ( d o c , o p ) 
 { 
 	 v a r   t o t a l , i , b o o l _ o b j , t e m p ; 
 
 / /   c h e c k   f o r   t h e   n u m b e r   o f   s e l e c t e d   o b j e c t s 
 
 	 f o r ( t o t a l = 0 ; o b j e c t ( t o t a l ) ; t o t a l + + ) 
 	 	 { 
 	 	 i f ( o b j e c t ( t o t a l ) - > G e t T y p e ( ) ! = O p o l y g o n ) 
 	 	 	 { 
 	 	 	 T e x t D i a l o g ( " A l l   o b j e c t s   n e e d   t o   b e   p o l y g o n a l   a n d   a t   l e a s t   o n e   i s   p a r a m e t r i c   ( " + o b j e c t ( t o t a l ) - > G e t N a m e ( ) + " ) .   P l e a s e   c o n v e r t   t h e m   a l l . " ) ; 
 	 	 	 r e t u r n ; 
 	 	 	 } 
 	 	 } 
 	 i f ( t o t a l < 2 )   r e t u r n ; 	 / /   n o   o b j e c t s   s e l e c t e d   o r   j u s t   o n e   s e l e c t e d 
 
 	 d o c - > S t a r t U n d o ( ) ; 
 	 
 	 b o o l _ o b j = o b j e c t ( 0 ) - > G e t C l o n e ( C L _ N O _ H I E R A R C H Y ) ; 	 / /   g e t   t h e   f i r s t   o b j e c t 
 	 d o c - > A d d U n d o ( U N D O T Y P E _ C H A N G E , o b j e c t ( 0 ) ) ; 
 	 o b j e c t ( 0 ) # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ E D I T O R = 1 ; 	 / /   m a k e   i t   i n v i s i b l e   i n   t h e   e d i t o r 
 	 o b j e c t ( 0 ) # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ R E N D E R = 1 ; 	 / /   a n d   i n   t h e   r e n d e r e r 
 	 o b j e c t ( 0 ) - > M e s s a g e ( M S G _ U P D A T E ) ; 
 
 	 f o r   ( i = 1 ;   o b j e c t ( i ) ;   i + + )   / /   g o   t h r o u g h   a l l   r e m a i n i n g   o b j e c t s 
 	 	 { 
 	 	 v a r   t e m p _ d o c   =   n e w ( B a s e D o c u m e n t ) ; 	 / /   c r e a t e   a   n e w   v i r t u a l   d o c u m e n t 
 	 	 v a r   b o o l e a n   =   A l l o c O b j e c t ( O b o o l e ) ; 	 / /   c r e a t e   a   n e w   b o o l e a n   o b j e c t 
 	 	 v a r   t e m p _ o b j   =   o b j e c t ( i ) - > G e t C l o n e ( C L _ N O _ H I E R A R C H Y ) ; 	 / /   g e t   a   c l o n e   o f   t h e   f o l l o w i n g   o b j e c t 
 
 	 	 v a r   s u b t r a c t   =   ( t e m p _ o b j - > G e t N a m e ( ) [ 0 ] ) = = ' - ' ; 
 
 	 	 S t a t u s S e t T e x t ( " C o m b i n i n g   o b j e c t   " + t o s t r i n g ( i , " 0 . 0 d " ) + "   o f   " + t o s t r i n g ( t o t a l , " 0 . 0 d " ) ) ; 	 / /   d i s p l a y   w h a t   i s   b e i n g   m a d e 
 	 	 S t a t u s S e t B a r ( 1 . 0 - f l o a t ( t o t a l - i ) / f l o a t ( t o t a l ) ) ; 
 
 	 	 t e m p _ d o c - > I n s e r t O b j e c t ( b o o l e a n , N U L L , N U L L ) ; 	 / /   i n s e r t   t h e   b o o l e a n   i n   t h e   n e w   v i r t u a l   d o c u m e n t 
 	 	 t e m p _ d o c - > I n s e r t O b j e c t ( t e m p _ o b j , b o o l e a n , N U L L ) ; 	 / /   i n s e r t   t h e   s e c o n d   o b j e c t   i n s i d e   t h e   b o o l e a n 
 	 	 t e m p _ d o c - > I n s e r t O b j e c t ( b o o l _ o b j , b o o l e a n , N U L L ) ; 	 / /   i n s e r t   t h e   f i r s t   o b j e c t   i n s i d e   t h e   b o o l e a n 
 
 
 	 	 b o o l e a n # B O O L E O B J E C T _ T Y P E = s u b t r a c t ; 	 / /   s e t   t h e   b o o l e a n   t o   U n i o n 
 	 	 b o o l e a n # B O O L E O B J E C T _ S I N G L E _ O B J E C T = t r u e ; 	 / /   C r e a t e   a   s i n g l e   o b j e c t 
 	 	 b o o l e a n # B O O L E O B J E C T _ H I D E _ N E W _ E D G E S = t r u e ; 	 / /   a n d   h i d e   t h e   n e w l y   c r e a t e d   e d g e s 
 
 
 	 	 v a r   b c   =   t e m p _ d o c - > G e t C o n t a i n e r ( ) ; 
 	 	 / /   m a k e   t h e   b o o l e a n   e d i t a b l e   b u t   r e t u r n   i f   s o m e t h i n g   w r o n g   h a p p e n s 
 	 	 i f ( ! S e n d M o d e l i n g C o m m a n d ( M C O M M A N D _ M A K E E D I T A B L E , t e m p _ d o c , b o o l e a n , b c , M O D I F Y _ A L L ) )   r e t u r n ; 
 	 	 t e m p = t e m p _ d o c - > G e t F i r s t O b j e c t ( ) ; 	 / /   g e t   t h e   b o o l e a n   r e s u l t 
 	 	 / /   b u t   s o m e t i m e s   t h e   r e s u l t   o f   t h e   b o o l e a n   e n d s   u p   i n s i d e   a   n u l l 
 	 	 i f ( t e m p - > G e t T y p e ( ) = = O n u l l )   t e m p = t e m p - > G e t D o w n ( ) ; 	 / /   s o ,   g e t   w h a t   i s   i n s i d e   i t . 
 
 
 	 	 b o o l _ o b j   =   t e m p - > G e t C l o n e ( C L _ N O _ H I E R A R C H Y ) ; 	 / /   t h e   n e w   f i r s t   o b j e c t   i s   r e s u l t   o f   t h e   b o o l e a n 
 	 	 d o c - > A d d U n d o ( U N D O T Y P E _ C H A N G E , o b j e c t ( i ) ) ; 
 	 	 o b j e c t ( i ) # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ E D I T O R = 1 ; 	 / /   m a k e   t h e   l a s t   o b j e c t   u s e d   i n v i s i b l e   i n   t h e   e d i t o r 
 	 	 o b j e c t ( i ) # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ R E N D E R = 1 ; 	 / /   a n d   i n   t h e   r e n d e r e r 
 	 	 o b j e c t ( i ) - > M e s s a g e ( M S G _ U P D A T E ) ; 
 	 	 } 
 
 	 d o c - > I n s e r t O b j e c t ( b o o l _ o b j , N U L L , N U L L ) ; 	 / /   i n s e r t   t h e   r e s u l t i n g   o b j e c t   i n   t h e   d o c u m e n t 
 	 d o c - > A d d U n d o ( U N D O T Y P E _ N E W , b o o l _ o b j ) ; 
 	 b o o l _ o b j - > S e t N a m e ( " M u l t i   B o o l e a n " ) ; 	 / /   n a m e   i t   " M u l t i   B o o l e a n " 
 	 b o o l _ o b j # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ E D I T O R = 2 ; 	 / /   m a k e   s u r e   i t   i s   v i s i b l e   i n   t h e   e d i t o r 
 	 b o o l _ o b j # I D _ B A S E O B J E C T _ V I S I B I L I T Y _ R E N D E R = 2 ; 	 / /   a n d   i n   t h e   r e n d e r e r 
 	 d o c - > E n d U n d o ( ) ; 
 	 S t a t u s C l e a r ( ) ; 	 / /   c l e a r   t h e   s t a t u s   b a r 
 	 g c ( ) ; 	 / /   c l e a n   t h e   h o u s e   : - ) 
 } 
  �        �        �   ��    E N A B L E = T R U E ; �   " M u l t i - B o o l e a n   A d d           �   alias2        �   �-�?��
�?:�Z           ��                        ��     F}    �     �    