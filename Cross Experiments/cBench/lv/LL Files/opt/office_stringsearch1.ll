; ModuleID = 'office_stringsearch1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@lowervec = dso_local global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\7Fcueaaaaceeeiiiaae\91\92ooouuyou\9B\9C\9D\9E\9Faiounn\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16
@pat = internal global ptr null, align 8
@patlen = internal global i32 0, align 4
@skip = internal global [256 x i32] zeroinitializer, align 16
@skip2 = internal global i32 0, align 4
@patlen.1 = internal global i32 0, align 4
@pat.2 = internal global ptr null, align 8
@skip.3 = internal global [256 x i32] zeroinitializer, align 16
@skip2.4 = internal global i32 0, align 4
@pat.5 = internal global ptr null, align 8
@patlen.6 = internal global i32 0, align 4
@skip.7 = internal global [256 x i32] zeroinitializer, align 16
@skip2.8 = internal global i32 0, align 4
@len = internal global i64 0, align 8
@table = internal global [256 x i64] zeroinitializer, align 16
@findme = internal global ptr null, align 8
@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Error: too few parameters!\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"\0AError: Can't find text!\0A\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"\0AError: Can't find search strings!\0A\00", align 1
@str_misc = internal global [1024 x i8] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [22 x i8] c"Size1=%lu, size2=%lu\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"\0AError: Can't open file for writing!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"\22%s\22 is%s in \22%s\22\00", align 1
@.str.11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.12 = private unnamed_addr constant [5 x i8] c" not\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c" [\22%s\22]\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bmha_init(ptr noundef %arg) #0 {
bb:
  store ptr %arg, ptr @pat, align 8
  %i = call i64 @strlen(ptr noundef %arg) #8
  %i2 = trunc i64 %i to i32
  store i32 %i2, ptr @patlen, align 4
  br label %bb5

bb5:                                              ; preds = %bb48, %bb
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %bb48 ], [ 0, %bb ]
  %i6 = load i32, ptr @patlen, align 4
  %i8 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %indvars.iv2
  store i32 %i6, ptr %i8, align 4
  %i9 = load i32, ptr @patlen, align 4
  %i10 = sub nsw i32 %i9, 1
  %0 = trunc i64 %indvars.iv2 to i32
  %i14 = trunc i32 %0 to i8
  %i15 = zext i8 %i14 to i64
  %i16 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i15
  %i121 = icmp sge i32 %i10, 0
  br i1 %i121, label %bb13.lr.ph, label %bb32

bb13.lr.ph:                                       ; preds = %bb5
  %1 = sext i32 %i9 to i64
  %2 = add nsw i64 %1, -1
  %3 = add i64 %1, -2
  %4 = zext i32 %i10 to i64
  %5 = sub i64 %3, %4
  br label %bb13

bb13:                                             ; preds = %bb30, %bb13.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb30 ], [ %2, %bb13.lr.ph ]
  %i17 = load i8, ptr %i16, align 1
  %i18 = zext i8 %i17 to i32
  %i19 = load ptr, ptr @pat, align 8
  %i21 = getelementptr inbounds i8, ptr %i19, i64 %indvars.iv
  %i22 = load i8, ptr %i21, align 1
  %i23 = zext i8 %i22 to i64
  %i24 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i23
  %i25 = load i8, ptr %i24, align 1
  %i26 = zext i8 %i25 to i32
  %i27 = icmp eq i32 %i18, %i26
  br i1 %i27, label %bb13.bb32_crit_edge, label %bb30

bb30:                                             ; preds = %bb13
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %i12 = icmp sge i64 %indvars.iv.next, 0
  br i1 %i12, label %bb13, label %bb11.bb32_crit_edge, !llvm.loop !8

bb13.bb32_crit_edge:                              ; preds = %bb13
  %split.wide = phi i64 [ %indvars.iv, %bb13 ]
  %6 = trunc i64 %split.wide to i32
  br label %bb32

bb11.bb32_crit_edge:                              ; preds = %bb30
  %7 = trunc i64 %5 to i32
  br label %bb32

bb32:                                             ; preds = %bb11.bb32_crit_edge, %bb13.bb32_crit_edge, %bb5
  %.0.lcssa = phi i32 [ %6, %bb13.bb32_crit_edge ], [ %7, %bb11.bb32_crit_edge ], [ %i10, %bb5 ]
  %i33 = icmp sge i32 %.0.lcssa, 0
  br i1 %i33, label %bb34, label %bb40

bb34:                                             ; preds = %bb32
  %i35 = load i32, ptr @patlen, align 4
  %i36 = sub nsw i32 %i35, %.0.lcssa
  %i37 = sub nsw i32 %i36, 1
  %i39 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %indvars.iv2
  store i32 %i37, ptr %i39, align 4
  br label %bb40

bb40:                                             ; preds = %bb34, %bb32
  %i41 = load i32, ptr @patlen, align 4
  %i42 = sub nsw i32 %i41, 1
  %i43 = icmp eq i32 %.0.lcssa, %i42
  br i1 %i43, label %bb44, label %bb48

bb44:                                             ; preds = %bb40
  %i46 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %indvars.iv2
  store i32 32767, ptr %i46, align 4
  br label %bb48

bb48:                                             ; preds = %bb44, %bb40
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp ne i64 %indvars.iv.next3, 256
  br i1 %exitcond, label %bb5, label %bb50, !llvm.loop !10

bb50:                                             ; preds = %bb48
  %i51 = load i32, ptr @patlen, align 4
  store i32 %i51, ptr @skip2, align 4
  %i535 = load i32, ptr @patlen, align 4
  %i546 = sub nsw i32 %i535, 1
  %i557 = icmp slt i32 0, %i546
  br i1 %i557, label %bb56.lr.ph, label %bb83

bb56.lr.ph:                                       ; preds = %bb50
  br label %bb56

bb56:                                             ; preds = %bb81, %bb56.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %bb81 ], [ 0, %bb56.lr.ph ]
  %i57 = load ptr, ptr @pat, align 8
  %i59 = getelementptr inbounds i8, ptr %i57, i64 %indvars.iv5
  %i60 = load i8, ptr %i59, align 1
  %i61 = zext i8 %i60 to i64
  %i62 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i61
  %i63 = load i8, ptr %i62, align 1
  %i64 = zext i8 %i63 to i32
  %i65 = load ptr, ptr @pat, align 8
  %i66 = load i32, ptr @patlen, align 4
  %i67 = sub nsw i32 %i66, 1
  %i68 = sext i32 %i67 to i64
  %i69 = getelementptr inbounds i8, ptr %i65, i64 %i68
  %i70 = load i8, ptr %i69, align 1
  %i71 = zext i8 %i70 to i64
  %i72 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i71
  %i73 = load i8, ptr %i72, align 1
  %i74 = zext i8 %i73 to i32
  %i75 = icmp eq i32 %i64, %i74
  br i1 %i75, label %bb76, label %bb81

bb76:                                             ; preds = %bb56
  %i77 = load i32, ptr @patlen, align 4
  %8 = trunc i64 %indvars.iv5 to i32
  %i78 = sub nsw i32 %i77, %8
  %i79 = sub nsw i32 %i78, 1
  store i32 %i79, ptr @skip2, align 4
  br label %bb81

bb81:                                             ; preds = %bb76, %bb56
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %i53 = load i32, ptr @patlen, align 4
  %i54 = sub nsw i32 %i53, 1
  %9 = sext i32 %i54 to i64
  %i55 = icmp slt i64 %indvars.iv.next6, %9
  br i1 %i55, label %bb56, label %bb52.bb83_crit_edge, !llvm.loop !11

bb52.bb83_crit_edge:                              ; preds = %bb81
  br label %bb83

bb83:                                             ; preds = %bb52.bb83_crit_edge, %bb50
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bmha_search(ptr noundef %arg, i32 noundef %arg3) #0 {
bb:
  %i = load i32, ptr @patlen, align 4
  %i4 = sub nsw i32 %i, 1
  %i5 = sub nsw i32 %i4, %arg3
  %i6 = icmp sge i32 %i5, 0
  br i1 %i6, label %bb65, label %bb8

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb59, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i61, %bb59 ]
  br label %bb12

bb12:                                             ; preds = %bb12, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb12 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb12, label %bb22, !llvm.loop !12

bb22:                                             ; preds = %bb12
  %i19.lcssa = phi i32 [ %i19, %bb12 ]
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19.lcssa, %i23
  br i1 %i24, label %bb65.loopexit, label %bb26

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19.lcssa, 32767
  %i28 = load i32, ptr @patlen, align 4
  %i29 = sub i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  %0 = sext i32 %i29 to i64
  %1 = add i32 %i28, -2
  %smin = call i32 @llvm.smin.i32(i32 %1, i32 -1)
  br label %bb33

bb33:                                             ; preds = %bb36, %bb26
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb36 ], [ %0, %bb26 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %i35 = icmp sge i64 %indvars.iv.next, 0
  %2 = trunc i64 %indvars.iv.next to i32
  br i1 %i35, label %bb36, label %bb56

bb36:                                             ; preds = %bb33
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %indvars.iv.next
  %i39 = load i8, ptr %i38, align 1
  %i40 = zext i8 %i39 to i64
  %i41 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i40
  %i42 = load i8, ptr %i41, align 1
  %i43 = zext i8 %i42 to i32
  %i44 = load ptr, ptr @pat, align 8
  %i46 = getelementptr inbounds i8, ptr %i44, i64 %indvars.iv.next
  %i47 = load i8, ptr %i46, align 1
  %i48 = zext i8 %i47 to i64
  %i49 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i48
  %i50 = load i8, ptr %i49, align 1
  %i51 = zext i8 %i50 to i32
  %i52 = icmp eq i32 %i43, %i51
  br i1 %i52, label %bb33, label %bb56, !llvm.loop !13

bb56:                                             ; preds = %bb36, %bb33
  %i34.lcssa = phi i32 [ %2, %bb36 ], [ %smin, %bb33 ]
  %i57 = icmp slt i32 %i34.lcssa, 0
  br i1 %i57, label %bb65.loopexit, label %bb59

bb59:                                             ; preds = %bb56
  %i60 = load i32, ptr @skip2, align 4
  %i61 = add nsw i32 %i27, %i60
  %i62 = icmp sge i32 %i61, 0
  br i1 %i62, label %bb65.loopexit, label %bb11

bb65.loopexit:                                    ; preds = %bb59, %bb56, %bb22
  %.0.ph = phi ptr [ null, %bb59 ], [ %i32, %bb56 ], [ null, %bb22 ]
  br label %bb65

bb65:                                             ; preds = %bb65.loopexit, %bb
  %.0 = phi ptr [ null, %bb ], [ %.0.ph, %bb65.loopexit ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bmhi_init(ptr noundef %arg) #0 {
bb:
  %i = call i64 @strlen(ptr noundef %arg) #8
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.1, align 4
  %i2 = load ptr, ptr @pat.2, align 8
  %i3 = load i32, ptr @patlen.1, align 4
  %i4 = sext i32 %i3 to i64
  %i5 = call ptr @realloc(ptr noundef %i2, i64 noundef %i4) #9
  store ptr %i5, ptr @pat.2, align 8
  %i6 = load ptr, ptr @pat.2, align 8
  %i7 = icmp ne ptr %i6, null
  br i1 %i7, label %bb9, label %bb8

bb8:                                              ; preds = %bb
  call void @exit(i32 noundef 1) #10
  unreachable

bb9:                                              ; preds = %bb
  %i10 = call i32 @atexit(ptr noundef @bhmi_cleanup) #11
  %i131 = load i32, ptr @patlen.1, align 4
  %i142 = icmp slt i32 0, %i131
  br i1 %i142, label %bb15.lr.ph, label %bb28.preheader

bb15.lr.ph:                                       ; preds = %bb9
  br label %bb15

bb12.bb28.preheader_crit_edge:                    ; preds = %bb15
  br label %bb28.preheader

bb28.preheader:                                   ; preds = %bb12.bb28.preheader_crit_edge, %bb9
  br i1 false, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %bb28.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %vector.body ], [ 0, %vector.ph ]
  %0 = load i32, ptr @patlen.1, align 4
  %broadcast.splatinsert1 = insertelement <4 x i32> poison, i32 %0, i64 0
  %broadcast.splat2 = shufflevector <4 x i32> %broadcast.splatinsert1, <4 x i32> poison, <4 x i32> zeroinitializer
  %1 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %indvars.iv2
  %2 = getelementptr inbounds i32, ptr %1, i32 4
  store <4 x i32> %broadcast.splat2, ptr %1, align 4
  store <4 x i32> %broadcast.splat2, ptr %2, align 4
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 8
  %3 = icmp eq i64 %indvars.iv.next3, 256
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 true, label %bb37.preheader, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %bb28.preheader
  br label %bb30

bb15:                                             ; preds = %bb15, %bb15.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb15 ], [ 0, %bb15.lr.ph ]
  %i17 = getelementptr inbounds i8, ptr %arg, i64 %indvars.iv
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = call i32 @toupper(i32 noundef %i19) #8
  %i21 = trunc i32 %i20 to i8
  %i22 = load ptr, ptr @pat.2, align 8
  %i24 = getelementptr inbounds i8, ptr %i22, i64 %indvars.iv
  store i8 %i21, ptr %i24, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %i13 = load i32, ptr @patlen.1, align 4
  %4 = sext i32 %i13 to i64
  %i14 = icmp slt i64 %indvars.iv.next, %4
  br i1 %i14, label %bb15, label %bb12.bb28.preheader_crit_edge, !llvm.loop !17

bb37.preheader.loopexit:                          ; preds = %bb30
  br label %bb37.preheader

bb37.preheader:                                   ; preds = %bb37.preheader.loopexit, %middle.block
  %i385 = load i32, ptr @patlen.1, align 4
  %i396 = sub nsw i32 %i385, 1
  %i407 = icmp slt i32 0, %i396
  br i1 %i407, label %bb41.lr.ph, label %bb64

bb41.lr.ph:                                       ; preds = %bb37.preheader
  br label %bb41

bb30:                                             ; preds = %bb30, %scalar.ph
  %i31 = load i32, ptr @patlen.1, align 4
  store i32 %i31, ptr getelementptr inbounds ([256 x i32], ptr @skip.3, i64 1, i64 0), align 4
  br i1 false, label %bb30, label %bb37.preheader.loopexit, !llvm.loop !18

bb41:                                             ; preds = %bb41, %bb41.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %bb41 ], [ 0, %bb41.lr.ph ]
  %i42 = load i32, ptr @patlen.1, align 4
  %5 = trunc i64 %indvars.iv8 to i32
  %i43 = sub nsw i32 %i42, %5
  %i44 = sub nsw i32 %i43, 1
  %i45 = load ptr, ptr @pat.2, align 8
  %i47 = getelementptr inbounds i8, ptr %i45, i64 %indvars.iv8
  %i48 = load i8, ptr %i47, align 1
  %i49 = zext i8 %i48 to i64
  %i50 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i49
  store i32 %i44, ptr %i50, align 4
  %i51 = load i32, ptr @patlen.1, align 4
  %6 = trunc i64 %indvars.iv8 to i32
  %i52 = sub nsw i32 %i51, %6
  %i53 = sub nsw i32 %i52, 1
  %i54 = load ptr, ptr @pat.2, align 8
  %i56 = getelementptr inbounds i8, ptr %i54, i64 %indvars.iv8
  %i57 = load i8, ptr %i56, align 1
  %i58 = zext i8 %i57 to i32
  %i59 = call i32 @tolower(i32 noundef %i58) #8
  %i60 = sext i32 %i59 to i64
  %i61 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i60
  store i32 %i53, ptr %i61, align 4
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %i38 = load i32, ptr @patlen.1, align 4
  %i39 = sub nsw i32 %i38, 1
  %7 = sext i32 %i39 to i64
  %i40 = icmp slt i64 %indvars.iv.next9, %7
  br i1 %i40, label %bb41, label %bb37.bb64_crit_edge, !llvm.loop !19

bb37.bb64_crit_edge:                              ; preds = %bb41
  br label %bb64

bb64:                                             ; preds = %bb37.bb64_crit_edge, %bb37.preheader
  %i65 = load ptr, ptr @pat.2, align 8
  %i66 = load i32, ptr @patlen.1, align 4
  %i67 = sub nsw i32 %i66, 1
  %i68 = sext i32 %i67 to i64
  %i69 = getelementptr inbounds i8, ptr %i65, i64 %i68
  %i70 = load i8, ptr %i69, align 1
  %i71 = zext i8 %i70 to i32
  %i72 = sext i32 %i71 to i64
  %i73 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i72
  store i32 32767, ptr %i73, align 4
  %i74 = call i32 @tolower(i32 noundef %i71) #8
  %i75 = sext i32 %i74 to i64
  %i76 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i75
  store i32 32767, ptr %i76, align 4
  %i77 = load i32, ptr @patlen.1, align 4
  store i32 %i77, ptr @skip2.4, align 4
  %i799 = load i32, ptr @patlen.1, align 4
  %i8010 = sub nsw i32 %i799, 1
  %i8111 = icmp slt i32 0, %i8010
  br i1 %i8111, label %bb82.lr.ph, label %bb96

bb82.lr.ph:                                       ; preds = %bb64
  br label %bb82

bb82:                                             ; preds = %bb94, %bb82.lr.ph
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %bb94 ], [ 0, %bb82.lr.ph ]
  %i83 = load ptr, ptr @pat.2, align 8
  %i85 = getelementptr inbounds i8, ptr %i83, i64 %indvars.iv11
  %i86 = load i8, ptr %i85, align 1
  %i87 = zext i8 %i86 to i32
  %i88 = icmp eq i32 %i87, %i71
  br i1 %i88, label %bb89, label %bb94

bb89:                                             ; preds = %bb82
  %i90 = load i32, ptr @patlen.1, align 4
  %8 = trunc i64 %indvars.iv11 to i32
  %i91 = sub nsw i32 %i90, %8
  %i92 = sub nsw i32 %i91, 1
  store i32 %i92, ptr @skip2.4, align 4
  br label %bb94

bb94:                                             ; preds = %bb89, %bb82
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %i79 = load i32, ptr @patlen.1, align 4
  %i80 = sub nsw i32 %i79, 1
  %9 = sext i32 %i80 to i64
  %i81 = icmp slt i64 %indvars.iv.next12, %9
  br i1 %i81, label %bb82, label %bb78.bb96_crit_edge, !llvm.loop !20

bb78.bb96_crit_edge:                              ; preds = %bb94
  br label %bb96

bb96:                                             ; preds = %bb78.bb96_crit_edge, %bb64
  ret void
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @bhmi_cleanup() #0 {
bb:
  %i = load ptr, ptr @pat.2, align 8
  call void @free(ptr noundef %i) #11
  ret void
}

; Function Attrs: nounwind
declare i32 @atexit(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bmhi_search(ptr noundef %arg, i32 noundef %arg3) #0 {
bb:
  %i = load i32, ptr @patlen.1, align 4
  %i4 = sub nsw i32 %i, 1
  %i5 = sub nsw i32 %i4, %arg3
  %i6 = icmp sge i32 %i5, 0
  br i1 %i6, label %bb60, label %bb8

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb54, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i56, %bb54 ]
  br label %bb12

bb12:                                             ; preds = %bb12, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb12 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb12, label %bb22, !llvm.loop !21

bb22:                                             ; preds = %bb12
  %i19.lcssa = phi i32 [ %i19, %bb12 ]
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19.lcssa, %i23
  br i1 %i24, label %bb60.loopexit, label %bb26

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19.lcssa, 32767
  %i28 = load i32, ptr @patlen.1, align 4
  %i29 = sub i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  %0 = sext i32 %i29 to i64
  %1 = add i32 %i28, -2
  %smin = call i32 @llvm.smin.i32(i32 %1, i32 -1)
  br label %bb33

bb33:                                             ; preds = %bb36, %bb26
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb36 ], [ %0, %bb26 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %i35 = icmp sge i64 %indvars.iv.next, 0
  %2 = trunc i64 %indvars.iv.next to i32
  br i1 %i35, label %bb36, label %bb51

bb36:                                             ; preds = %bb33
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %indvars.iv.next
  %i39 = load i8, ptr %i38, align 1
  %i40 = sext i8 %i39 to i32
  %i41 = call i32 @toupper(i32 noundef %i40) #8
  %i42 = load ptr, ptr @pat.2, align 8
  %i44 = getelementptr inbounds i8, ptr %i42, i64 %indvars.iv.next
  %i45 = load i8, ptr %i44, align 1
  %i46 = zext i8 %i45 to i32
  %i47 = icmp eq i32 %i41, %i46
  br i1 %i47, label %bb33, label %bb51, !llvm.loop !22

bb51:                                             ; preds = %bb36, %bb33
  %i34.lcssa = phi i32 [ %2, %bb36 ], [ %smin, %bb33 ]
  %i52 = icmp slt i32 %i34.lcssa, 0
  br i1 %i52, label %bb60.loopexit, label %bb54

bb54:                                             ; preds = %bb51
  %i55 = load i32, ptr @skip2.4, align 4
  %i56 = add nsw i32 %i27, %i55
  %i57 = icmp sge i32 %i56, 0
  br i1 %i57, label %bb60.loopexit, label %bb11

bb60.loopexit:                                    ; preds = %bb54, %bb51, %bb22
  %.0.ph = phi ptr [ null, %bb54 ], [ %i32, %bb51 ], [ null, %bb22 ]
  br label %bb60

bb60:                                             ; preds = %bb60.loopexit, %bb
  %.0 = phi ptr [ null, %bb ], [ %.0.ph, %bb60.loopexit ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bmh_init(ptr noundef %arg) #0 {
bb:
  store ptr %arg, ptr @pat.5, align 8
  %i = call i64 @strlen(ptr noundef %arg) #8
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.6, align 4
  br i1 false, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %bb
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %vector.body ], [ 0, %vector.ph ]
  %0 = load i32, ptr @patlen.6, align 4
  %broadcast.splatinsert1 = insertelement <4 x i32> poison, i32 %0, i64 0
  %broadcast.splat2 = shufflevector <4 x i32> %broadcast.splatinsert1, <4 x i32> poison, <4 x i32> zeroinitializer
  %1 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %indvars.iv
  %2 = getelementptr inbounds i32, ptr %1, i32 4
  store <4 x i32> %broadcast.splat2, ptr %1, align 4
  store <4 x i32> %broadcast.splat2, ptr %2, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 8
  %3 = icmp eq i64 %indvars.iv.next, 256
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  br i1 true, label %bb11.preheader, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %bb
  br label %bb4

bb11.preheader.loopexit:                          ; preds = %bb4
  br label %bb11.preheader

bb11.preheader:                                   ; preds = %bb11.preheader.loopexit, %middle.block
  %i122 = load i32, ptr @patlen.6, align 4
  %i133 = icmp slt i32 0, %i122
  br i1 %i133, label %bb14.lr.ph, label %bb26

bb14.lr.ph:                                       ; preds = %bb11.preheader
  br label %bb14

bb4:                                              ; preds = %bb4, %scalar.ph
  %i5 = load i32, ptr @patlen.6, align 4
  store i32 %i5, ptr getelementptr inbounds ([256 x i32], ptr @skip.7, i64 1, i64 0), align 4
  br i1 false, label %bb4, label %bb11.preheader.loopexit, !llvm.loop !24

bb14:                                             ; preds = %bb14, %bb14.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %bb14 ], [ 0, %bb14.lr.ph ]
  %i15 = load i32, ptr @patlen.6, align 4
  %4 = trunc i64 %indvars.iv5 to i32
  %i16 = sub nsw i32 %i15, %4
  %i17 = sub nsw i32 %i16, 1
  %i18 = load ptr, ptr @pat.5, align 8
  %i20 = getelementptr inbounds i8, ptr %i18, i64 %indvars.iv5
  %i21 = load i8, ptr %i20, align 1
  %i22 = zext i8 %i21 to i64
  %i23 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i22
  store i32 %i17, ptr %i23, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %i12 = load i32, ptr @patlen.6, align 4
  %5 = sext i32 %i12 to i64
  %i13 = icmp slt i64 %indvars.iv.next6, %5
  br i1 %i13, label %bb14, label %bb11.bb26_crit_edge, !llvm.loop !25

bb11.bb26_crit_edge:                              ; preds = %bb14
  br label %bb26

bb26:                                             ; preds = %bb11.bb26_crit_edge, %bb11.preheader
  %i27 = load ptr, ptr @pat.5, align 8
  %i28 = load i32, ptr @patlen.6, align 4
  %i29 = sub nsw i32 %i28, 1
  %i30 = sext i32 %i29 to i64
  %i31 = getelementptr inbounds i8, ptr %i27, i64 %i30
  %i32 = load i8, ptr %i31, align 1
  %i33 = zext i8 %i32 to i32
  %i34 = sext i32 %i33 to i64
  %i35 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i34
  store i32 32767, ptr %i35, align 4
  %i36 = load i32, ptr @patlen.6, align 4
  store i32 %i36, ptr @skip2.8, align 4
  %i385 = load i32, ptr @patlen.6, align 4
  %i396 = sub nsw i32 %i385, 1
  %i407 = icmp slt i32 0, %i396
  br i1 %i407, label %bb41.lr.ph, label %bb55

bb41.lr.ph:                                       ; preds = %bb26
  br label %bb41

bb41:                                             ; preds = %bb53, %bb41.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %bb53 ], [ 0, %bb41.lr.ph ]
  %i42 = load ptr, ptr @pat.5, align 8
  %i44 = getelementptr inbounds i8, ptr %i42, i64 %indvars.iv8
  %i45 = load i8, ptr %i44, align 1
  %i46 = zext i8 %i45 to i32
  %i47 = icmp eq i32 %i46, %i33
  br i1 %i47, label %bb48, label %bb53

bb48:                                             ; preds = %bb41
  %i49 = load i32, ptr @patlen.6, align 4
  %6 = trunc i64 %indvars.iv8 to i32
  %i50 = sub nsw i32 %i49, %6
  %i51 = sub nsw i32 %i50, 1
  store i32 %i51, ptr @skip2.8, align 4
  br label %bb53

bb53:                                             ; preds = %bb48, %bb41
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %i38 = load i32, ptr @patlen.6, align 4
  %i39 = sub nsw i32 %i38, 1
  %7 = sext i32 %i39 to i64
  %i40 = icmp slt i64 %indvars.iv.next9, %7
  br i1 %i40, label %bb41, label %bb37.bb55_crit_edge, !llvm.loop !26

bb37.bb55_crit_edge:                              ; preds = %bb53
  br label %bb55

bb55:                                             ; preds = %bb37.bb55_crit_edge, %bb26
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bmh_search(ptr noundef %arg, i32 noundef %arg3) #0 {
bb:
  %i = load i32, ptr @patlen.6, align 4
  %i4 = sub nsw i32 %i, 1
  %i5 = sub nsw i32 %i4, %arg3
  %i6 = icmp sge i32 %i5, 0
  br i1 %i6, label %bb59, label %bb8

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb53, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i55, %bb53 ]
  br label %bb12

bb12:                                             ; preds = %bb12, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb12 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb12, label %bb22, !llvm.loop !27

bb22:                                             ; preds = %bb12
  %i19.lcssa = phi i32 [ %i19, %bb12 ]
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19.lcssa, %i23
  br i1 %i24, label %bb59.loopexit, label %bb26

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19.lcssa, 32767
  %i28 = load i32, ptr @patlen.6, align 4
  %i29 = sub i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  %0 = sext i32 %i29 to i64
  %1 = add i32 %i28, -2
  %smin = call i32 @llvm.smin.i32(i32 %1, i32 -1)
  br label %bb33

bb33:                                             ; preds = %bb36, %bb26
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb36 ], [ %0, %bb26 ]
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %i35 = icmp sge i64 %indvars.iv.next, 0
  %2 = trunc i64 %indvars.iv.next to i32
  br i1 %i35, label %bb36, label %bb50

bb36:                                             ; preds = %bb33
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %indvars.iv.next
  %i39 = load i8, ptr %i38, align 1
  %i40 = sext i8 %i39 to i32
  %i41 = load ptr, ptr @pat.5, align 8
  %i43 = getelementptr inbounds i8, ptr %i41, i64 %indvars.iv.next
  %i44 = load i8, ptr %i43, align 1
  %i45 = zext i8 %i44 to i32
  %i46 = icmp eq i32 %i40, %i45
  br i1 %i46, label %bb33, label %bb50, !llvm.loop !28

bb50:                                             ; preds = %bb36, %bb33
  %i34.lcssa = phi i32 [ %2, %bb36 ], [ %smin, %bb33 ]
  %i51 = icmp slt i32 %i34.lcssa, 0
  br i1 %i51, label %bb59.loopexit, label %bb53

bb53:                                             ; preds = %bb50
  %i54 = load i32, ptr @skip2.8, align 4
  %i55 = add nsw i32 %i27, %i54
  %i56 = icmp sge i32 %i55, 0
  br i1 %i56, label %bb59.loopexit, label %bb11

bb59.loopexit:                                    ; preds = %bb53, %bb50, %bb22
  %.0.ph = phi ptr [ null, %bb53 ], [ %i32, %bb50 ], [ null, %bb22 ]
  br label %bb59

bb59:                                             ; preds = %bb59.loopexit, %bb
  %.0 = phi ptr [ null, %bb ], [ %.0.ph, %bb59.loopexit ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_search(ptr noundef %arg) #0 {
bb:
  %i = call i64 @strlen(ptr noundef %arg) #8
  store i64 %i, ptr @len, align 8
  br i1 false, label %scalar.ph, label %vector.ph

vector.ph:                                        ; preds = %bb
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %0 = load i64, ptr @len, align 8
  %broadcast.splatinsert1 = insertelement <2 x i64> poison, i64 %0, i64 0
  %broadcast.splat2 = shufflevector <2 x i64> %broadcast.splatinsert1, <2 x i64> poison, <2 x i32> zeroinitializer
  %1 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %index
  %2 = getelementptr inbounds i64, ptr %1, i32 2
  store <2 x i64> %broadcast.splat2, ptr %1, align 8
  store <2 x i64> %broadcast.splat2, ptr %2, align 8
  %index.next = add nuw nsw i64 %index, 4
  %3 = icmp eq i64 %index.next, 256
  br i1 %3, label %middle.block, label %vector.body, !llvm.loop !29

middle.block:                                     ; preds = %vector.body
  br i1 true, label %bb9.preheader, label %scalar.ph

scalar.ph:                                        ; preds = %middle.block, %bb
  %bc.resume.val = phi i64 [ 256, %middle.block ], [ 0, %bb ]
  br label %bb3

bb9.preheader.loopexit:                           ; preds = %bb3
  br label %bb9.preheader

bb9.preheader:                                    ; preds = %bb9.preheader.loopexit, %middle.block
  %i102 = load i64, ptr @len, align 8
  %i113 = icmp ult i64 0, %i102
  br i1 %i113, label %bb12.lr.ph, label %bb22

bb12.lr.ph:                                       ; preds = %bb9.preheader
  br label %bb12

bb3:                                              ; preds = %bb3, %scalar.ph
  %i4 = load i64, ptr @len, align 8
  %i5 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %bc.resume.val
  store i64 %i4, ptr %i5, align 8
  br i1 false, label %bb3, label %bb9.preheader.loopexit, !llvm.loop !30

bb12:                                             ; preds = %bb12, %bb12.lr.ph
  %.14 = phi i64 [ 0, %bb12.lr.ph ], [ %i21, %bb12 ]
  %i13 = load i64, ptr @len, align 8
  %i14 = sub i64 %i13, %.14
  %i15 = sub i64 %i14, 1
  %i16 = getelementptr inbounds i8, ptr %arg, i64 %.14
  %i17 = load i8, ptr %i16, align 1
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i18
  store i64 %i15, ptr %i19, align 8
  %i21 = add nuw i64 %.14, 1
  %i10 = load i64, ptr @len, align 8
  %i11 = icmp ult i64 %i21, %i10
  br i1 %i11, label %bb12, label %bb9.bb22_crit_edge, !llvm.loop !31

bb9.bb22_crit_edge:                               ; preds = %bb12
  br label %bb22

bb22:                                             ; preds = %bb9.bb22_crit_edge, %bb9.preheader
  store ptr %arg, ptr @findme, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @strsearch(ptr noundef %arg) #0 {
bb:
  %i = load i64, ptr @len, align 8
  %i5 = sub i64 %i, 1
  %i6 = call i64 @strlen(ptr noundef %arg) #8
  %i81 = icmp ult i64 %i5, %i6
  br i1 %i81, label %bb10.preheader.lr.ph, label %bb40

bb10.preheader.lr.ph:                             ; preds = %bb
  br label %bb10.preheader

bb10.preheader:                                   ; preds = %bb38, %bb10.preheader.lr.ph
  %.013 = phi i64 [ %i5, %bb10.preheader.lr.ph ], [ %.2, %bb38 ]
  %.022 = phi i64 [ undef, %bb10.preheader.lr.ph ], [ %.24.lcssa, %bb38 ]
  br label %bb10

bb10:                                             ; preds = %bb19, %bb10.preheader
  %.13 = phi i64 [ %.24, %bb19 ], [ %.022, %bb10.preheader ]
  %.1 = phi i64 [ %i22, %bb19 ], [ %.013, %bb10.preheader ]
  %i11 = icmp ult i64 %.1, %i6
  br i1 %i11, label %bb12, label %bb19

bb12:                                             ; preds = %bb10
  %i13 = getelementptr inbounds i8, ptr %arg, i64 %.1
  %i14 = load i8, ptr %i13, align 1
  %i15 = zext i8 %i14 to i64
  %i16 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i15
  %i17 = load i64, ptr %i16, align 8
  %i18 = icmp ugt i64 %i17, 0
  br label %bb19

bb19:                                             ; preds = %bb12, %bb10
  %.24 = phi i64 [ %i17, %bb12 ], [ %.13, %bb10 ]
  %i20 = phi i1 [ %i18, %bb12 ], [ false, %bb10 ]
  %i22 = add i64 %.1, %.24
  br i1 %i20, label %bb10, label %bb23, !llvm.loop !32

bb23:                                             ; preds = %bb19
  %.24.lcssa = phi i64 [ %.24, %bb19 ]
  %.1.lcssa = phi i64 [ %.1, %bb19 ]
  %i24 = icmp eq i64 0, %.24.lcssa
  br i1 %i24, label %bb25, label %bb38

bb25:                                             ; preds = %bb23
  %i26 = load ptr, ptr @findme, align 8
  %i27 = load i64, ptr @len, align 8
  %i28 = sub i64 %.1.lcssa, %i27
  %i29 = add i64 %i28, 1
  %i30 = getelementptr inbounds i8, ptr %arg, i64 %i29
  %i31 = load i64, ptr @len, align 8
  %i32 = call i32 @strncmp(ptr noundef %i26, ptr noundef %i30, i64 noundef %i31) #8
  %i33 = icmp eq i32 0, %i32
  br i1 %i33, label %bb25.bb40_crit_edge, label %bb35

bb35:                                             ; preds = %bb25
  %i36 = add i64 %.1.lcssa, 1
  br label %bb38

bb38:                                             ; preds = %bb35, %bb23
  %.2 = phi i64 [ %i36, %bb35 ], [ %.1.lcssa, %bb23 ]
  %i8 = icmp ult i64 %.2, %i6
  br i1 %i8, label %bb10.preheader, label %bb7.bb40_crit_edge, !llvm.loop !33

bb25.bb40_crit_edge:                              ; preds = %bb25
  %split = phi ptr [ %i30, %bb25 ]
  br label %bb40

bb7.bb40_crit_edge:                               ; preds = %bb38
  %split4 = phi ptr [ null, %bb38 ]
  br label %bb40

bb40:                                             ; preds = %bb7.bb40_crit_edge, %bb25.bb40_crit_edge, %bb
  %.0 = phi ptr [ %split, %bb25.bb40_crit_edge ], [ %split4, %bb7.bb40_crit_edge ], [ null, %bb ]
  ret ptr %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg11) #0 {
bb:
  %i = alloca i64, align 8
  %i12 = alloca [128000 x ptr], align 16
  %i13 = alloca [128000 x ptr], align 16
  %i14 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i15 = icmp eq ptr %i14, null
  br i1 %i15, label %bb16, label %bb19

bb16:                                             ; preds = %bb
  %i17 = load ptr, ptr @stderr, align 8
  %i18 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i17, ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #10
  unreachable

bb19:                                             ; preds = %bb
  %i20 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.3, ptr noundef %i)
  %i21 = call i32 @fclose(ptr noundef %i14)
  %i22 = icmp slt i32 %arg, 3
  br i1 %i22, label %bb23, label %bb26

bb23:                                             ; preds = %bb19
  %i24 = load ptr, ptr @stderr, align 8
  %i25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i24, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #10
  unreachable

bb26:                                             ; preds = %bb19
  %i27 = getelementptr inbounds ptr, ptr %arg11, i64 1
  %i28 = load ptr, ptr %i27, align 8
  %i29 = call noalias ptr @fopen(ptr noundef %i28, ptr noundef @.str.1)
  %i30 = icmp eq ptr %i29, null
  br i1 %i30, label %bb31, label %bb34

bb31:                                             ; preds = %bb26
  %i32 = load ptr, ptr @stderr, align 8
  %i33 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i32, ptr noundef @.str.5)
  call void @exit(i32 noundef 1) #10
  unreachable

bb34:                                             ; preds = %bb26
  %i35 = getelementptr inbounds ptr, ptr %arg11, i64 2
  %i36 = load ptr, ptr %i35, align 8
  %i37 = call noalias ptr @fopen(ptr noundef %i36, ptr noundef @.str.1)
  %i38 = icmp eq ptr %i37, null
  br i1 %i38, label %bb39, label %bb43.preheader

bb43.preheader:                                   ; preds = %bb34
  %i441 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i29)
  %i452 = icmp ne ptr %i441, null
  br i1 %i452, label %bb46.lr.ph, label %bb56

bb46.lr.ph:                                       ; preds = %bb43.preheader
  br label %bb46

bb39:                                             ; preds = %bb34
  %i40 = load ptr, ptr @stderr, align 8
  %i41 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i40, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #10
  unreachable

bb46:                                             ; preds = %bb51, %bb46.lr.ph
  %.093 = phi i64 [ 0, %bb46.lr.ph ], [ %i55, %bb51 ]
  %i47 = call i32 @feof(ptr noundef %i29) #11
  %i48 = icmp eq i32 %i47, 0
  br i1 %i48, label %bb51, label %bb46.bb56_crit_edge

bb51:                                             ; preds = %bb46
  %i53 = call i64 @strlen(ptr noundef @str_misc) #8
  %i54 = add i64 %i53, 1
  %i55 = add i64 %.093, %i54
  %i44 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i29)
  %i45 = icmp ne ptr %i44, null
  br i1 %i45, label %bb46, label %bb43.bb56_crit_edge, !llvm.loop !34

bb46.bb56_crit_edge:                              ; preds = %bb46
  %split = phi i64 [ %.093, %bb46 ]
  br label %bb56

bb43.bb56_crit_edge:                              ; preds = %bb51
  %split5 = phi i64 [ %i55, %bb51 ]
  br label %bb56

bb56:                                             ; preds = %bb43.bb56_crit_edge, %bb46.bb56_crit_edge, %bb43.preheader
  %.09.lcssa = phi i64 [ %split, %bb46.bb56_crit_edge ], [ %split5, %bb43.bb56_crit_edge ], [ 0, %bb43.preheader ]
  %i586 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i37)
  %i597 = icmp ne ptr %i586, null
  br i1 %i597, label %bb60.lr.ph, label %bb70

bb60.lr.ph:                                       ; preds = %bb56
  br label %bb60

bb60:                                             ; preds = %bb65, %bb60.lr.ph
  %.038 = phi i64 [ 0, %bb60.lr.ph ], [ %i69, %bb65 ]
  %i61 = call i32 @feof(ptr noundef %i37) #11
  %i62 = icmp eq i32 %i61, 0
  br i1 %i62, label %bb65, label %bb60.bb70_crit_edge

bb65:                                             ; preds = %bb60
  %i67 = call i64 @strlen(ptr noundef @str_misc) #8
  %i68 = add i64 %i67, 1
  %i69 = add i64 %.038, %i68
  %i58 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i37)
  %i59 = icmp ne ptr %i58, null
  br i1 %i59, label %bb60, label %bb57.bb70_crit_edge, !llvm.loop !35

bb60.bb70_crit_edge:                              ; preds = %bb60
  %split10 = phi i64 [ %.038, %bb60 ]
  br label %bb70

bb57.bb70_crit_edge:                              ; preds = %bb65
  %split11 = phi i64 [ %i69, %bb65 ]
  br label %bb70

bb70:                                             ; preds = %bb57.bb70_crit_edge, %bb60.bb70_crit_edge, %bb56
  %.03.lcssa = phi i64 [ %split10, %bb60.bb70_crit_edge ], [ %split11, %bb57.bb70_crit_edge ], [ 0, %bb56 ]
  %i71 = call i32 @fclose(ptr noundef %i29)
  %i72 = call i32 @fclose(ptr noundef %i37)
  %i73 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i64 noundef %.09.lcssa, i64 noundef %.03.lcssa)
  %i74 = mul i64 1, %.09.lcssa
  %i75 = call noalias ptr @malloc(i64 noundef %i74) #12
  %i76 = mul i64 1, %.03.lcssa
  %i77 = call noalias ptr @malloc(i64 noundef %i76) #12
  %i78 = getelementptr inbounds ptr, ptr %arg11, i64 1
  %i79 = load ptr, ptr %i78, align 8
  %i80 = call noalias ptr @fopen(ptr noundef %i79, ptr noundef @.str.1)
  %i81 = icmp eq ptr %i80, null
  br i1 %i81, label %bb82, label %bb85

bb82:                                             ; preds = %bb70
  %i83 = load ptr, ptr @stderr, align 8
  %i84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i83, ptr noundef @.str.5)
  call void @exit(i32 noundef 1) #10
  unreachable

bb85:                                             ; preds = %bb70
  %i86 = getelementptr inbounds ptr, ptr %arg11, i64 2
  %i87 = load ptr, ptr %i86, align 8
  %i88 = call noalias ptr @fopen(ptr noundef %i87, ptr noundef @.str.1)
  %i89 = icmp eq ptr %i88, null
  br i1 %i89, label %bb90, label %bb94.preheader

bb94.preheader:                                   ; preds = %bb85
  %i9512 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i80)
  %i9613 = icmp ne ptr %i9512, null
  br i1 %i9613, label %bb97.lr.ph, label %bb118

bb97.lr.ph:                                       ; preds = %bb94.preheader
  br label %bb97

bb90:                                             ; preds = %bb85
  %i91 = load ptr, ptr @stderr, align 8
  %i92 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i91, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #10
  unreachable

bb97:                                             ; preds = %bb109, %bb97.lr.ph
  %.1215 = phi i64 [ 0, %bb97.lr.ph ], [ %i114, %bb109 ]
  %.11014 = phi i64 [ 0, %bb97.lr.ph ], [ %i117, %bb109 ]
  %i98 = call i32 @feof(ptr noundef %i80) #11
  %i99 = icmp eq i32 %i98, 0
  br i1 %i99, label %bb102, label %bb97.bb118_crit_edge

bb102:                                            ; preds = %bb97
  %i103 = call i64 @strlen(ptr noundef @str_misc) #8
  %i104 = icmp ugt i64 %i103, 0
  br i1 %i104, label %bb105, label %bb109

bb105:                                            ; preds = %bb102
  %i106 = call i64 @strlen(ptr noundef @str_misc) #8
  %i107 = sub i64 %i106, 1
  %i108 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i107
  store i8 0, ptr %i108, align 1
  br label %bb109

bb109:                                            ; preds = %bb105, %bb102
  %i110 = getelementptr inbounds i8, ptr %i75, i64 %.11014
  %i111 = call ptr @strcpy(ptr noundef %i110, ptr noundef @str_misc) #11
  %i112 = getelementptr inbounds i8, ptr %i75, i64 %.11014
  %i113 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %.1215
  store ptr %i112, ptr %i113, align 8
  %i114 = add nuw nsw i64 %.1215, 1
  %i115 = call i64 @strlen(ptr noundef @str_misc) #8
  %i116 = add i64 %i115, 1
  %i117 = add i64 %.11014, %i116
  %i95 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i80)
  %i96 = icmp ne ptr %i95, null
  br i1 %i96, label %bb97, label %bb94.bb118_crit_edge, !llvm.loop !36

bb97.bb118_crit_edge:                             ; preds = %bb97
  %split16 = phi i64 [ %.1215, %bb97 ]
  br label %bb118

bb94.bb118_crit_edge:                             ; preds = %bb109
  %split17 = phi i64 [ %i114, %bb109 ]
  br label %bb118

bb118:                                            ; preds = %bb94.bb118_crit_edge, %bb97.bb118_crit_edge, %bb94.preheader
  %.12.lcssa = phi i64 [ %split16, %bb97.bb118_crit_edge ], [ %split17, %bb94.bb118_crit_edge ], [ 0, %bb94.preheader ]
  %i119 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %.12.lcssa
  store ptr null, ptr %i119, align 8
  %i12118 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i88)
  %i12219 = icmp ne ptr %i12118, null
  br i1 %i12219, label %bb123.lr.ph, label %bb144

bb123.lr.ph:                                      ; preds = %bb118
  br label %bb123

bb123:                                            ; preds = %bb135, %bb123.lr.ph
  %.121 = phi i64 [ 0, %bb123.lr.ph ], [ %i140, %bb135 ]
  %.1420 = phi i64 [ 0, %bb123.lr.ph ], [ %i143, %bb135 ]
  %i124 = call i32 @feof(ptr noundef %i88) #11
  %i125 = icmp eq i32 %i124, 0
  br i1 %i125, label %bb128, label %bb123.bb144_crit_edge

bb128:                                            ; preds = %bb123
  %i129 = call i64 @strlen(ptr noundef @str_misc) #8
  %i130 = icmp ugt i64 %i129, 0
  br i1 %i130, label %bb131, label %bb135

bb131:                                            ; preds = %bb128
  %i132 = call i64 @strlen(ptr noundef @str_misc) #8
  %i133 = sub i64 %i132, 1
  %i134 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i133
  store i8 0, ptr %i134, align 1
  br label %bb135

bb135:                                            ; preds = %bb131, %bb128
  %i136 = getelementptr inbounds i8, ptr %i77, i64 %.1420
  %i137 = call ptr @strcpy(ptr noundef %i136, ptr noundef @str_misc) #11
  %i138 = getelementptr inbounds i8, ptr %i77, i64 %.1420
  %i139 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %.121
  store ptr %i138, ptr %i139, align 8
  %i140 = add nuw nsw i64 %.121, 1
  %i141 = call i64 @strlen(ptr noundef @str_misc) #8
  %i142 = add i64 %i141, 1
  %i143 = add i64 %.1420, %i142
  %i121 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i88)
  %i122 = icmp ne ptr %i121, null
  br i1 %i122, label %bb123, label %bb120.bb144_crit_edge, !llvm.loop !37

bb123.bb144_crit_edge:                            ; preds = %bb123
  %split22 = phi i64 [ %.121, %bb123 ]
  br label %bb144

bb120.bb144_crit_edge:                            ; preds = %bb135
  %split23 = phi i64 [ %i140, %bb135 ]
  br label %bb144

bb144:                                            ; preds = %bb120.bb144_crit_edge, %bb123.bb144_crit_edge, %bb118
  %.1.lcssa = phi i64 [ %split22, %bb123.bb144_crit_edge ], [ %split23, %bb120.bb144_crit_edge ], [ 0, %bb118 ]
  %i145 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %.1.lcssa
  store ptr null, ptr %i145, align 8
  %i146 = call i32 @fclose(ptr noundef %i80)
  %i147 = call i32 @fclose(ptr noundef %i88)
  %i148 = getelementptr inbounds ptr, ptr %arg11, i64 3
  %i149 = load ptr, ptr %i148, align 8
  %i150 = call noalias ptr @fopen(ptr noundef %i149, ptr noundef @.str.8)
  %i151 = icmp eq ptr %i150, null
  br i1 %i151, label %bb152, label %bb156.preheader

bb156.preheader:                                  ; preds = %bb144
  %i15928 = load ptr, ptr %i13, align 8
  %i16029 = icmp ne ptr %i15928, null
  br i1 %i16029, label %bb161.lr.ph, label %bb193

bb161.lr.ph:                                      ; preds = %bb156.preheader
  br label %bb161

bb152:                                            ; preds = %bb144
  %i153 = load ptr, ptr @stderr, align 8
  %i154 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i153, ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #10
  unreachable

bb161:                                            ; preds = %bb189, %bb161.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %bb189 ], [ 0, %bb161.lr.ph ]
  %.0531 = phi ptr [ null, %bb161.lr.ph ], [ %.16.lcssa, %bb189 ]
  %i163 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %indvars.iv
  %i164 = load ptr, ptr %i163, align 8
  call void @init_search(ptr noundef %i164)
  %i16624 = load i64, ptr %i, align 8
  %i16725 = icmp slt i64 0, %i16624
  br i1 %i16725, label %bb168.lr.ph, label %bb175

bb168.lr.ph:                                      ; preds = %bb161
  br label %bb168

bb168:                                            ; preds = %bb168, %bb168.lr.ph
  %.0826 = phi i64 [ 0, %bb168.lr.ph ], [ %i174, %bb168 ]
  %i170 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %indvars.iv
  %i171 = load ptr, ptr %i170, align 8
  %i172 = call ptr @strsearch(ptr noundef %i171)
  %i174 = add nuw nsw i64 %.0826, 1
  %i166 = load i64, ptr %i, align 8
  %i167 = icmp slt i64 %i174, %i166
  br i1 %i167, label %bb168, label %bb165.bb175_crit_edge, !llvm.loop !38

bb165.bb175_crit_edge:                            ; preds = %bb168
  %split27 = phi ptr [ %i172, %bb168 ]
  br label %bb175

bb175:                                            ; preds = %bb165.bb175_crit_edge, %bb161
  %.16.lcssa = phi ptr [ %split27, %bb165.bb175_crit_edge ], [ %.0531, %bb161 ]
  %i177 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %indvars.iv
  %i178 = load ptr, ptr %i177, align 8
  %i179 = icmp ne ptr %.16.lcssa, null
  %i180 = zext i1 %i179 to i64
  %i181 = select i1 %i179, ptr @.str.11, ptr @.str.12
  %i183 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %indvars.iv
  %i184 = load ptr, ptr %i183, align 8
  %i185 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.10, ptr noundef %i178, ptr noundef %i181, ptr noundef %i184)
  %i186 = icmp ne ptr %.16.lcssa, null
  br i1 %i186, label %bb187, label %bb189

bb187:                                            ; preds = %bb175
  %i188 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.13, ptr noundef %.16.lcssa)
  br label %bb189

bb189:                                            ; preds = %bb187, %bb175
  %i190 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.14)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %i158 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %indvars.iv.next
  %i159 = load ptr, ptr %i158, align 8
  %i160 = icmp ne ptr %i159, null
  br i1 %i160, label %bb161, label %bb156.bb193_crit_edge, !llvm.loop !39

bb156.bb193_crit_edge:                            ; preds = %bb189
  br label %bb193

bb193:                                            ; preds = %bb156.bb193_crit_edge, %bb156.preheader
  %i194 = call i32 @fclose(ptr noundef %i150)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #5

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #5

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #5

declare i32 @fclose(ptr noundef) #5

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #5

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #4

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #6

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #7

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind allocsize(1) }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5, !6, !7}

!0 = !{!"clang version 18.1.8 (https://github.com/llvm/llvm-project.git 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{i32 1, !"ThinLTO", i32 0}
!7 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !9}
!13 = distinct !{!13, !9}
!14 = distinct !{!14, !9, !15, !16}
!15 = !{!"llvm.loop.isvectorized", i32 1}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9, !16, !15}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !9, !15, !16}
!24 = distinct !{!24, !9, !16, !15}
!25 = distinct !{!25, !9}
!26 = distinct !{!26, !9}
!27 = distinct !{!27, !9}
!28 = distinct !{!28, !9}
!29 = distinct !{!29, !9, !15, !16}
!30 = distinct !{!30, !9, !16, !15}
!31 = distinct !{!31, !9}
!32 = distinct !{!32, !9}
!33 = distinct !{!33, !9}
!34 = distinct !{!34, !9}
!35 = distinct !{!35, !9}
!36 = distinct !{!36, !9}
!37 = distinct !{!37, !9}
!38 = distinct !{!38, !9}
!39 = distinct !{!39, !9}
