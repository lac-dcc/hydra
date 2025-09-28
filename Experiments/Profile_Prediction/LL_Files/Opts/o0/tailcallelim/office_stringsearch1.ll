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
  %i = tail call i64 @strlen(ptr noundef %arg) #7
  %i2 = trunc i64 %i to i32
  store i32 %i2, ptr @patlen, align 4
  br label %bb3

bb3:                                              ; preds = %bb48, %bb
  %.01 = phi i32 [ 0, %bb ], [ %i49, %bb48 ]
  %i4 = icmp sle i32 %.01, 255
  br i1 %i4, label %bb5, label %bb50

bb5:                                              ; preds = %bb3
  %i6 = load i32, ptr @patlen, align 4
  %i7 = sext i32 %.01 to i64
  %i8 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i7
  store i32 %i6, ptr %i8, align 4
  %i9 = load i32, ptr @patlen, align 4
  %i10 = sub nsw i32 %i9, 1
  br label %bb11

bb11:                                             ; preds = %bb30, %bb5
  %.0 = phi i32 [ %i10, %bb5 ], [ %i31, %bb30 ]
  %i12 = icmp sge i32 %.0, 0
  br i1 %i12, label %bb13, label %bb32.loopexit

bb13:                                             ; preds = %bb11
  %i14 = trunc i32 %.01 to i8
  %i15 = zext i8 %i14 to i64
  %i16 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i15
  %i17 = load i8, ptr %i16, align 1
  %i18 = zext i8 %i17 to i32
  %i19 = load ptr, ptr @pat, align 8
  %i20 = sext i32 %.0 to i64
  %i21 = getelementptr inbounds i8, ptr %i19, i64 %i20
  %i22 = load i8, ptr %i21, align 1
  %i23 = zext i8 %i22 to i64
  %i24 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i23
  %i25 = load i8, ptr %i24, align 1
  %i26 = zext i8 %i25 to i32
  %i27 = icmp eq i32 %i18, %i26
  br i1 %i27, label %bb28, label %bb29

bb28:                                             ; preds = %bb13
  br label %bb32

bb29:                                             ; preds = %bb13
  br label %bb30

bb30:                                             ; preds = %bb29
  %i31 = add nsw i32 %.0, -1
  br label %bb11, !llvm.loop !8

bb32.loopexit:                                    ; preds = %bb11
  br label %bb32

bb32:                                             ; preds = %bb32.loopexit, %bb28
  %i33 = icmp sge i32 %.0, 0
  br i1 %i33, label %bb34, label %bb32.bb40_crit_edge

bb32.bb40_crit_edge:                              ; preds = %bb32
  br label %bb40

bb34:                                             ; preds = %bb32
  %i35 = load i32, ptr @patlen, align 4
  %i36 = sub nsw i32 %i35, %.0
  %i37 = sub nsw i32 %i36, 1
  %i38 = sext i32 %.01 to i64
  %i39 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i38
  store i32 %i37, ptr %i39, align 4
  br label %bb40

bb40:                                             ; preds = %bb32.bb40_crit_edge, %bb34
  %i41 = load i32, ptr @patlen, align 4
  %i42 = sub nsw i32 %i41, 1
  %i43 = icmp eq i32 %.0, %i42
  br i1 %i43, label %bb44, label %bb40.bb47_crit_edge

bb40.bb47_crit_edge:                              ; preds = %bb40
  br label %bb47

bb44:                                             ; preds = %bb40
  %i45 = sext i32 %.01 to i64
  %i46 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i45
  store i32 32767, ptr %i46, align 4
  br label %bb47

bb47:                                             ; preds = %bb40.bb47_crit_edge, %bb44
  br label %bb48

bb48:                                             ; preds = %bb47
  %i49 = add nsw i32 %.01, 1
  br label %bb3, !llvm.loop !10

bb50:                                             ; preds = %bb3
  %i51 = load i32, ptr @patlen, align 4
  store i32 %i51, ptr @skip2, align 4
  br label %bb52

bb52:                                             ; preds = %bb81, %bb50
  %.1 = phi i32 [ 0, %bb50 ], [ %i82, %bb81 ]
  %i53 = load i32, ptr @patlen, align 4
  %i54 = sub nsw i32 %i53, 1
  %i55 = icmp slt i32 %.1, %i54
  br i1 %i55, label %bb56, label %bb83

bb56:                                             ; preds = %bb52
  %i57 = load ptr, ptr @pat, align 8
  %i58 = sext i32 %.1 to i64
  %i59 = getelementptr inbounds i8, ptr %i57, i64 %i58
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
  br i1 %i75, label %bb76, label %bb56.bb80_crit_edge

bb56.bb80_crit_edge:                              ; preds = %bb56
  br label %bb80

bb76:                                             ; preds = %bb56
  %i77 = load i32, ptr @patlen, align 4
  %i78 = sub nsw i32 %i77, %.1
  %i79 = sub nsw i32 %i78, 1
  store i32 %i79, ptr @skip2, align 4
  br label %bb80

bb80:                                             ; preds = %bb56.bb80_crit_edge, %bb76
  br label %bb81

bb81:                                             ; preds = %bb80
  %i82 = add nsw i32 %.1, 1
  br label %bb52, !llvm.loop !11

bb83:                                             ; preds = %bb52
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
  br i1 %i6, label %bb7, label %bb8

bb7:                                              ; preds = %bb
  br label %bb65

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb64, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i61, %bb64 ]
  br label %bb12

bb12:                                             ; preds = %bb21, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb21 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb21, label %bb22

bb21:                                             ; preds = %bb12
  br label %bb12, !llvm.loop !12

bb22:                                             ; preds = %bb12
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19, %i23
  br i1 %i24, label %bb25, label %bb26

bb25:                                             ; preds = %bb22
  br label %bb65

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19, 32767
  %i28 = load i32, ptr @patlen, align 4
  %i29 = sub nsw i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb55, %bb26
  %.01 = phi i32 [ %i29, %bb26 ], [ %i34, %bb55 ]
  %i34 = add nsw i32 %.01, -1
  %i35 = icmp sge i32 %i34, 0
  br i1 %i35, label %bb36, label %bb33.bb53_crit_edge

bb33.bb53_crit_edge:                              ; preds = %bb33
  br label %bb53

bb36:                                             ; preds = %bb33
  %i37 = sext i32 %i34 to i64
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %i37
  %i39 = load i8, ptr %i38, align 1
  %i40 = zext i8 %i39 to i64
  %i41 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i40
  %i42 = load i8, ptr %i41, align 1
  %i43 = zext i8 %i42 to i32
  %i44 = load ptr, ptr @pat, align 8
  %i45 = sext i32 %i34 to i64
  %i46 = getelementptr inbounds i8, ptr %i44, i64 %i45
  %i47 = load i8, ptr %i46, align 1
  %i48 = zext i8 %i47 to i64
  %i49 = getelementptr inbounds [256 x i8], ptr @lowervec, i64 0, i64 %i48
  %i50 = load i8, ptr %i49, align 1
  %i51 = zext i8 %i50 to i32
  %i52 = icmp eq i32 %i43, %i51
  br label %bb53

bb53:                                             ; preds = %bb33.bb53_crit_edge, %bb36
  %i54 = phi i1 [ false, %bb33.bb53_crit_edge ], [ %i52, %bb36 ]
  br i1 %i54, label %bb55, label %bb56

bb55:                                             ; preds = %bb53
  br label %bb33, !llvm.loop !13

bb56:                                             ; preds = %bb53
  %i57 = icmp slt i32 %i34, 0
  br i1 %i57, label %bb58, label %bb59

bb58:                                             ; preds = %bb56
  br label %bb65

bb59:                                             ; preds = %bb56
  %i60 = load i32, ptr @skip2, align 4
  %i61 = add nsw i32 %i27, %i60
  %i62 = icmp sge i32 %i61, 0
  br i1 %i62, label %bb63, label %bb64

bb63:                                             ; preds = %bb59
  br label %bb65

bb64:                                             ; preds = %bb59
  br label %bb11

bb65:                                             ; preds = %bb63, %bb58, %bb25, %bb7
  %.0 = phi ptr [ null, %bb7 ], [ null, %bb25 ], [ %i32, %bb58 ], [ null, %bb63 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bmhi_init(ptr noundef %arg) #0 {
bb:
  %i = tail call i64 @strlen(ptr noundef %arg) #7
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.1, align 4
  %i2 = load ptr, ptr @pat.2, align 8
  %i3 = load i32, ptr @patlen.1, align 4
  %i4 = sext i32 %i3 to i64
  %i5 = tail call ptr @realloc(ptr noundef %i2, i64 noundef %i4) #8
  store ptr %i5, ptr @pat.2, align 8
  %i6 = load ptr, ptr @pat.2, align 8
  %i7 = icmp ne ptr %i6, null
  br i1 %i7, label %bb9, label %bb8

bb8:                                              ; preds = %bb
  tail call void @exit(i32 noundef 1) #9
  unreachable

bb9:                                              ; preds = %bb
  %i10 = tail call i32 @atexit(ptr noundef @bhmi_cleanup) #10
  br label %bb11

bb11:                                             ; preds = %bb9
  br label %bb12

bb12:                                             ; preds = %bb25, %bb11
  %.0 = phi i32 [ 0, %bb11 ], [ %i26, %bb25 ]
  %i13 = load i32, ptr @patlen.1, align 4
  %i14 = icmp slt i32 %.0, %i13
  br i1 %i14, label %bb15, label %bb27

bb15:                                             ; preds = %bb12
  %i16 = sext i32 %.0 to i64
  %i17 = getelementptr inbounds i8, ptr %arg, i64 %i16
  %i18 = load i8, ptr %i17, align 1
  %i19 = sext i8 %i18 to i32
  %i20 = tail call i32 @toupper(i32 noundef %i19) #7
  %i21 = trunc i32 %i20 to i8
  %i22 = load ptr, ptr @pat.2, align 8
  %i23 = sext i32 %.0 to i64
  %i24 = getelementptr inbounds i8, ptr %i22, i64 %i23
  store i8 %i21, ptr %i24, align 1
  br label %bb25

bb25:                                             ; preds = %bb15
  %i26 = add nsw i32 %.0, 1
  br label %bb12, !llvm.loop !14

bb27:                                             ; preds = %bb12
  br label %bb28

bb28:                                             ; preds = %bb34, %bb27
  %.1 = phi i32 [ 0, %bb27 ], [ %i35, %bb34 ]
  %i29 = icmp sle i32 %.1, 255
  br i1 %i29, label %bb30, label %bb36

bb30:                                             ; preds = %bb28
  %i31 = load i32, ptr @patlen.1, align 4
  %i32 = sext i32 %.1 to i64
  %i33 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i32
  store i32 %i31, ptr %i33, align 4
  br label %bb34

bb34:                                             ; preds = %bb30
  %i35 = add nsw i32 %.1, 1
  br label %bb28, !llvm.loop !15

bb36:                                             ; preds = %bb28
  br label %bb37

bb37:                                             ; preds = %bb62, %bb36
  %.2 = phi i32 [ 0, %bb36 ], [ %i63, %bb62 ]
  %i38 = load i32, ptr @patlen.1, align 4
  %i39 = sub nsw i32 %i38, 1
  %i40 = icmp slt i32 %.2, %i39
  br i1 %i40, label %bb41, label %bb64

bb41:                                             ; preds = %bb37
  %i42 = load i32, ptr @patlen.1, align 4
  %i43 = sub nsw i32 %i42, %.2
  %i44 = sub nsw i32 %i43, 1
  %i45 = load ptr, ptr @pat.2, align 8
  %i46 = sext i32 %.2 to i64
  %i47 = getelementptr inbounds i8, ptr %i45, i64 %i46
  %i48 = load i8, ptr %i47, align 1
  %i49 = zext i8 %i48 to i64
  %i50 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i49
  store i32 %i44, ptr %i50, align 4
  %i51 = load i32, ptr @patlen.1, align 4
  %i52 = sub nsw i32 %i51, %.2
  %i53 = sub nsw i32 %i52, 1
  %i54 = load ptr, ptr @pat.2, align 8
  %i55 = sext i32 %.2 to i64
  %i56 = getelementptr inbounds i8, ptr %i54, i64 %i55
  %i57 = load i8, ptr %i56, align 1
  %i58 = zext i8 %i57 to i32
  %i59 = tail call i32 @tolower(i32 noundef %i58) #7
  %i60 = sext i32 %i59 to i64
  %i61 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i60
  store i32 %i53, ptr %i61, align 4
  br label %bb62

bb62:                                             ; preds = %bb41
  %i63 = add nsw i32 %.2, 1
  br label %bb37, !llvm.loop !16

bb64:                                             ; preds = %bb37
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
  %i74 = tail call i32 @tolower(i32 noundef %i71) #7
  %i75 = sext i32 %i74 to i64
  %i76 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i75
  store i32 32767, ptr %i76, align 4
  %i77 = load i32, ptr @patlen.1, align 4
  store i32 %i77, ptr @skip2.4, align 4
  br label %bb78

bb78:                                             ; preds = %bb94, %bb64
  %.3 = phi i32 [ 0, %bb64 ], [ %i95, %bb94 ]
  %i79 = load i32, ptr @patlen.1, align 4
  %i80 = sub nsw i32 %i79, 1
  %i81 = icmp slt i32 %.3, %i80
  br i1 %i81, label %bb82, label %bb96

bb82:                                             ; preds = %bb78
  %i83 = load ptr, ptr @pat.2, align 8
  %i84 = sext i32 %.3 to i64
  %i85 = getelementptr inbounds i8, ptr %i83, i64 %i84
  %i86 = load i8, ptr %i85, align 1
  %i87 = zext i8 %i86 to i32
  %i88 = icmp eq i32 %i87, %i71
  br i1 %i88, label %bb89, label %bb82.bb93_crit_edge

bb82.bb93_crit_edge:                              ; preds = %bb82
  br label %bb93

bb89:                                             ; preds = %bb82
  %i90 = load i32, ptr @patlen.1, align 4
  %i91 = sub nsw i32 %i90, %.3
  %i92 = sub nsw i32 %i91, 1
  store i32 %i92, ptr @skip2.4, align 4
  br label %bb93

bb93:                                             ; preds = %bb82.bb93_crit_edge, %bb89
  br label %bb94

bb94:                                             ; preds = %bb93
  %i95 = add nsw i32 %.3, 1
  br label %bb78, !llvm.loop !17

bb96:                                             ; preds = %bb78
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
  tail call void @free(ptr noundef %i) #10
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
  br i1 %i6, label %bb7, label %bb8

bb7:                                              ; preds = %bb
  br label %bb60

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb59, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i56, %bb59 ]
  br label %bb12

bb12:                                             ; preds = %bb21, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb21 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip.3, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb21, label %bb22

bb21:                                             ; preds = %bb12
  br label %bb12, !llvm.loop !18

bb22:                                             ; preds = %bb12
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19, %i23
  br i1 %i24, label %bb25, label %bb26

bb25:                                             ; preds = %bb22
  br label %bb60

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19, 32767
  %i28 = load i32, ptr @patlen.1, align 4
  %i29 = sub nsw i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb50, %bb26
  %.01 = phi i32 [ %i29, %bb26 ], [ %i34, %bb50 ]
  %i34 = add nsw i32 %.01, -1
  %i35 = icmp sge i32 %i34, 0
  br i1 %i35, label %bb36, label %bb33.bb48_crit_edge

bb33.bb48_crit_edge:                              ; preds = %bb33
  br label %bb48

bb36:                                             ; preds = %bb33
  %i37 = sext i32 %i34 to i64
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %i37
  %i39 = load i8, ptr %i38, align 1
  %i40 = sext i8 %i39 to i32
  %i41 = tail call i32 @toupper(i32 noundef %i40) #7
  %i42 = load ptr, ptr @pat.2, align 8
  %i43 = sext i32 %i34 to i64
  %i44 = getelementptr inbounds i8, ptr %i42, i64 %i43
  %i45 = load i8, ptr %i44, align 1
  %i46 = zext i8 %i45 to i32
  %i47 = icmp eq i32 %i41, %i46
  br label %bb48

bb48:                                             ; preds = %bb33.bb48_crit_edge, %bb36
  %i49 = phi i1 [ false, %bb33.bb48_crit_edge ], [ %i47, %bb36 ]
  br i1 %i49, label %bb50, label %bb51

bb50:                                             ; preds = %bb48
  br label %bb33, !llvm.loop !19

bb51:                                             ; preds = %bb48
  %i52 = icmp slt i32 %i34, 0
  br i1 %i52, label %bb53, label %bb54

bb53:                                             ; preds = %bb51
  br label %bb60

bb54:                                             ; preds = %bb51
  %i55 = load i32, ptr @skip2.4, align 4
  %i56 = add nsw i32 %i27, %i55
  %i57 = icmp sge i32 %i56, 0
  br i1 %i57, label %bb58, label %bb59

bb58:                                             ; preds = %bb54
  br label %bb60

bb59:                                             ; preds = %bb54
  br label %bb11

bb60:                                             ; preds = %bb58, %bb53, %bb25, %bb7
  %.0 = phi ptr [ null, %bb7 ], [ null, %bb25 ], [ %i32, %bb53 ], [ null, %bb58 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @bmh_init(ptr noundef %arg) #0 {
bb:
  store ptr %arg, ptr @pat.5, align 8
  %i = tail call i64 @strlen(ptr noundef %arg) #7
  %i1 = trunc i64 %i to i32
  store i32 %i1, ptr @patlen.6, align 4
  br label %bb2

bb2:                                              ; preds = %bb8, %bb
  %.0 = phi i32 [ 0, %bb ], [ %i9, %bb8 ]
  %i3 = icmp sle i32 %.0, 255
  br i1 %i3, label %bb4, label %bb10

bb4:                                              ; preds = %bb2
  %i5 = load i32, ptr @patlen.6, align 4
  %i6 = sext i32 %.0 to i64
  %i7 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i6
  store i32 %i5, ptr %i7, align 4
  br label %bb8

bb8:                                              ; preds = %bb4
  %i9 = add nsw i32 %.0, 1
  br label %bb2, !llvm.loop !20

bb10:                                             ; preds = %bb2
  br label %bb11

bb11:                                             ; preds = %bb24, %bb10
  %.1 = phi i32 [ 0, %bb10 ], [ %i25, %bb24 ]
  %i12 = load i32, ptr @patlen.6, align 4
  %i13 = icmp slt i32 %.1, %i12
  br i1 %i13, label %bb14, label %bb26

bb14:                                             ; preds = %bb11
  %i15 = load i32, ptr @patlen.6, align 4
  %i16 = sub nsw i32 %i15, %.1
  %i17 = sub nsw i32 %i16, 1
  %i18 = load ptr, ptr @pat.5, align 8
  %i19 = sext i32 %.1 to i64
  %i20 = getelementptr inbounds i8, ptr %i18, i64 %i19
  %i21 = load i8, ptr %i20, align 1
  %i22 = zext i8 %i21 to i64
  %i23 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i22
  store i32 %i17, ptr %i23, align 4
  br label %bb24

bb24:                                             ; preds = %bb14
  %i25 = add nsw i32 %.1, 1
  br label %bb11, !llvm.loop !21

bb26:                                             ; preds = %bb11
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
  br label %bb37

bb37:                                             ; preds = %bb53, %bb26
  %.2 = phi i32 [ 0, %bb26 ], [ %i54, %bb53 ]
  %i38 = load i32, ptr @patlen.6, align 4
  %i39 = sub nsw i32 %i38, 1
  %i40 = icmp slt i32 %.2, %i39
  br i1 %i40, label %bb41, label %bb55

bb41:                                             ; preds = %bb37
  %i42 = load ptr, ptr @pat.5, align 8
  %i43 = sext i32 %.2 to i64
  %i44 = getelementptr inbounds i8, ptr %i42, i64 %i43
  %i45 = load i8, ptr %i44, align 1
  %i46 = zext i8 %i45 to i32
  %i47 = icmp eq i32 %i46, %i33
  br i1 %i47, label %bb48, label %bb41.bb52_crit_edge

bb41.bb52_crit_edge:                              ; preds = %bb41
  br label %bb52

bb48:                                             ; preds = %bb41
  %i49 = load i32, ptr @patlen.6, align 4
  %i50 = sub nsw i32 %i49, %.2
  %i51 = sub nsw i32 %i50, 1
  store i32 %i51, ptr @skip2.8, align 4
  br label %bb52

bb52:                                             ; preds = %bb41.bb52_crit_edge, %bb48
  br label %bb53

bb53:                                             ; preds = %bb52
  %i54 = add nsw i32 %.2, 1
  br label %bb37, !llvm.loop !22

bb55:                                             ; preds = %bb37
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bmh_search(ptr noundef %arg, i32 noundef %arg3) #0 {
bb:
  %i = load i32, ptr @patlen.6, align 4
  %i4 = sub nsw i32 %i, 1
  %i5 = sub nsw i32 %i4, %arg3
  %i6 = icmp sge i32 %i5, 0
  br i1 %i6, label %bb7, label %bb8

bb7:                                              ; preds = %bb
  br label %bb59

bb8:                                              ; preds = %bb
  %i9 = sext i32 %arg3 to i64
  %i10 = getelementptr inbounds i8, ptr %arg, i64 %i9
  br label %bb11

bb11:                                             ; preds = %bb58, %bb8
  %.02 = phi i32 [ %i5, %bb8 ], [ %i55, %bb58 ]
  br label %bb12

bb12:                                             ; preds = %bb21, %bb11
  %.1 = phi i32 [ %.02, %bb11 ], [ %i19, %bb21 ]
  %i13 = sext i32 %.1 to i64
  %i14 = getelementptr inbounds i8, ptr %i10, i64 %i13
  %i15 = load i8, ptr %i14, align 1
  %i16 = zext i8 %i15 to i64
  %i17 = getelementptr inbounds [256 x i32], ptr @skip.7, i64 0, i64 %i16
  %i18 = load i32, ptr %i17, align 4
  %i19 = add nsw i32 %.1, %i18
  %i20 = icmp slt i32 %i19, 0
  br i1 %i20, label %bb21, label %bb22

bb21:                                             ; preds = %bb12
  br label %bb12, !llvm.loop !23

bb22:                                             ; preds = %bb12
  %i23 = sub nsw i32 32767, %arg3
  %i24 = icmp slt i32 %i19, %i23
  br i1 %i24, label %bb25, label %bb26

bb25:                                             ; preds = %bb22
  br label %bb59

bb26:                                             ; preds = %bb22
  %i27 = sub nsw i32 %i19, 32767
  %i28 = load i32, ptr @patlen.6, align 4
  %i29 = sub nsw i32 %i28, 1
  %i30 = sub nsw i32 %i27, %i29
  %i31 = sext i32 %i30 to i64
  %i32 = getelementptr inbounds i8, ptr %i10, i64 %i31
  br label %bb33

bb33:                                             ; preds = %bb49, %bb26
  %.01 = phi i32 [ %i29, %bb26 ], [ %i34, %bb49 ]
  %i34 = add nsw i32 %.01, -1
  %i35 = icmp sge i32 %i34, 0
  br i1 %i35, label %bb36, label %bb33.bb47_crit_edge

bb33.bb47_crit_edge:                              ; preds = %bb33
  br label %bb47

bb36:                                             ; preds = %bb33
  %i37 = sext i32 %i34 to i64
  %i38 = getelementptr inbounds i8, ptr %i32, i64 %i37
  %i39 = load i8, ptr %i38, align 1
  %i40 = sext i8 %i39 to i32
  %i41 = load ptr, ptr @pat.5, align 8
  %i42 = sext i32 %i34 to i64
  %i43 = getelementptr inbounds i8, ptr %i41, i64 %i42
  %i44 = load i8, ptr %i43, align 1
  %i45 = zext i8 %i44 to i32
  %i46 = icmp eq i32 %i40, %i45
  br label %bb47

bb47:                                             ; preds = %bb33.bb47_crit_edge, %bb36
  %i48 = phi i1 [ false, %bb33.bb47_crit_edge ], [ %i46, %bb36 ]
  br i1 %i48, label %bb49, label %bb50

bb49:                                             ; preds = %bb47
  br label %bb33, !llvm.loop !24

bb50:                                             ; preds = %bb47
  %i51 = icmp slt i32 %i34, 0
  br i1 %i51, label %bb52, label %bb53

bb52:                                             ; preds = %bb50
  br label %bb59

bb53:                                             ; preds = %bb50
  %i54 = load i32, ptr @skip2.8, align 4
  %i55 = add nsw i32 %i27, %i54
  %i56 = icmp sge i32 %i55, 0
  br i1 %i56, label %bb57, label %bb58

bb57:                                             ; preds = %bb53
  br label %bb59

bb58:                                             ; preds = %bb53
  br label %bb11

bb59:                                             ; preds = %bb57, %bb52, %bb25, %bb7
  %.0 = phi ptr [ null, %bb7 ], [ null, %bb25 ], [ %i32, %bb52 ], [ null, %bb57 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_search(ptr noundef %arg) #0 {
bb:
  %i = tail call i64 @strlen(ptr noundef %arg) #7
  store i64 %i, ptr @len, align 8
  br label %bb1

bb1:                                              ; preds = %bb6, %bb
  %.0 = phi i64 [ 0, %bb ], [ %i7, %bb6 ]
  %i2 = icmp ule i64 %.0, 255
  br i1 %i2, label %bb3, label %bb8

bb3:                                              ; preds = %bb1
  %i4 = load i64, ptr @len, align 8
  %i5 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %.0
  store i64 %i4, ptr %i5, align 8
  br label %bb6

bb6:                                              ; preds = %bb3
  %i7 = add i64 %.0, 1
  br label %bb1, !llvm.loop !25

bb8:                                              ; preds = %bb1
  br label %bb9

bb9:                                              ; preds = %bb20, %bb8
  %.1 = phi i64 [ 0, %bb8 ], [ %i21, %bb20 ]
  %i10 = load i64, ptr @len, align 8
  %i11 = icmp ult i64 %.1, %i10
  br i1 %i11, label %bb12, label %bb22

bb12:                                             ; preds = %bb9
  %i13 = load i64, ptr @len, align 8
  %i14 = sub i64 %i13, %.1
  %i15 = sub i64 %i14, 1
  %i16 = getelementptr inbounds i8, ptr %arg, i64 %.1
  %i17 = load i8, ptr %i16, align 1
  %i18 = zext i8 %i17 to i64
  %i19 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i18
  store i64 %i15, ptr %i19, align 8
  br label %bb20

bb20:                                             ; preds = %bb12
  %i21 = add i64 %.1, 1
  br label %bb9, !llvm.loop !26

bb22:                                             ; preds = %bb9
  store ptr %arg, ptr @findme, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @strsearch(ptr noundef %arg) #0 {
bb:
  %i = load i64, ptr @len, align 8
  %i5 = sub i64 %i, 1
  %i6 = tail call i64 @strlen(ptr noundef %arg) #7
  br label %bb7

bb7:                                              ; preds = %bb38, %bb
  %.02 = phi i64 [ undef, %bb ], [ %.24, %bb38 ]
  %.01 = phi i64 [ %i5, %bb ], [ %.2, %bb38 ]
  %i8 = icmp ult i64 %.01, %i6
  br i1 %i8, label %bb9, label %bb39

bb9:                                              ; preds = %bb7
  br label %bb10

bb10:                                             ; preds = %bb21, %bb9
  %.13 = phi i64 [ %.02, %bb9 ], [ %.24, %bb21 ]
  %.1 = phi i64 [ %.01, %bb9 ], [ %i22, %bb21 ]
  %i11 = icmp ult i64 %.1, %i6
  br i1 %i11, label %bb12, label %bb10.bb19_crit_edge

bb10.bb19_crit_edge:                              ; preds = %bb10
  br label %bb19

bb12:                                             ; preds = %bb10
  %i13 = getelementptr inbounds i8, ptr %arg, i64 %.1
  %i14 = load i8, ptr %i13, align 1
  %i15 = zext i8 %i14 to i64
  %i16 = getelementptr inbounds [256 x i64], ptr @table, i64 0, i64 %i15
  %i17 = load i64, ptr %i16, align 8
  %i18 = icmp ugt i64 %i17, 0
  br label %bb19

bb19:                                             ; preds = %bb10.bb19_crit_edge, %bb12
  %.24 = phi i64 [ %i17, %bb12 ], [ %.13, %bb10.bb19_crit_edge ]
  %i20 = phi i1 [ false, %bb10.bb19_crit_edge ], [ %i18, %bb12 ]
  br i1 %i20, label %bb21, label %bb23

bb21:                                             ; preds = %bb19
  %i22 = add i64 %.1, %.24
  br label %bb10, !llvm.loop !27

bb23:                                             ; preds = %bb19
  %i24 = icmp eq i64 0, %.24
  br i1 %i24, label %bb25, label %bb23.bb38_crit_edge

bb23.bb38_crit_edge:                              ; preds = %bb23
  br label %bb38

bb25:                                             ; preds = %bb23
  %i26 = load ptr, ptr @findme, align 8
  %i27 = load i64, ptr @len, align 8
  %i28 = sub i64 %.1, %i27
  %i29 = add i64 %i28, 1
  %i30 = getelementptr inbounds i8, ptr %arg, i64 %i29
  %i31 = load i64, ptr @len, align 8
  %i32 = tail call i32 @strncmp(ptr noundef %i26, ptr noundef %i30, i64 noundef %i31) #7
  %i33 = icmp eq i32 0, %i32
  br i1 %i33, label %bb34, label %bb35

bb34:                                             ; preds = %bb25
  br label %bb40

bb35:                                             ; preds = %bb25
  %i36 = add i64 %.1, 1
  br label %bb37

bb37:                                             ; preds = %bb35
  br label %bb38

bb38:                                             ; preds = %bb23.bb38_crit_edge, %bb37
  %.2 = phi i64 [ %i36, %bb37 ], [ %.1, %bb23.bb38_crit_edge ]
  br label %bb7, !llvm.loop !28

bb39:                                             ; preds = %bb7
  br label %bb40

bb40:                                             ; preds = %bb39, %bb34
  %.0 = phi ptr [ %i30, %bb34 ], [ null, %bb39 ]
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
  %i14 = tail call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i15 = icmp eq ptr %i14, null
  br i1 %i15, label %bb16, label %bb19

bb16:                                             ; preds = %bb
  %i17 = load ptr, ptr @stderr, align 8
  %i18 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i17, ptr noundef @.str.2)
  tail call void @exit(i32 noundef 1) #9
  unreachable

bb19:                                             ; preds = %bb
  %i20 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.3, ptr noundef %i)
  %i21 = call i32 @fclose(ptr noundef %i14)
  %i22 = icmp slt i32 %arg, 3
  br i1 %i22, label %bb23, label %bb26

bb23:                                             ; preds = %bb19
  %i24 = load ptr, ptr @stderr, align 8
  %i25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i24, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #9
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
  call void @exit(i32 noundef 1) #9
  unreachable

bb34:                                             ; preds = %bb26
  %i35 = getelementptr inbounds ptr, ptr %arg11, i64 2
  %i36 = load ptr, ptr %i35, align 8
  %i37 = call noalias ptr @fopen(ptr noundef %i36, ptr noundef @.str.1)
  %i38 = icmp eq ptr %i37, null
  br i1 %i38, label %bb39, label %bb42

bb39:                                             ; preds = %bb34
  %i40 = load ptr, ptr @stderr, align 8
  %i41 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i40, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #9
  unreachable

bb42:                                             ; preds = %bb34
  br label %bb43

bb43:                                             ; preds = %bb51, %bb42
  %.09 = phi i64 [ 0, %bb42 ], [ %i55, %bb51 ]
  %.01 = phi i64 [ 0, %bb42 ], [ %i52, %bb51 ]
  %i44 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i29)
  %i45 = icmp ne ptr %i44, null
  br i1 %i45, label %bb46, label %bb43.bb49_crit_edge

bb43.bb49_crit_edge:                              ; preds = %bb43
  br label %bb49

bb46:                                             ; preds = %bb43
  %i47 = call i32 @feof(ptr noundef %i29) #10
  %i48 = icmp eq i32 %i47, 0
  br label %bb49

bb49:                                             ; preds = %bb43.bb49_crit_edge, %bb46
  %i50 = phi i1 [ false, %bb43.bb49_crit_edge ], [ %i48, %bb46 ]
  br i1 %i50, label %bb51, label %bb56

bb51:                                             ; preds = %bb49
  %i52 = add nsw i64 %.01, 1
  %i53 = call i64 @strlen(ptr noundef @str_misc) #7
  %i54 = add i64 %i53, 1
  %i55 = add i64 %.09, %i54
  br label %bb43, !llvm.loop !29

bb56:                                             ; preds = %bb49
  br label %bb57

bb57:                                             ; preds = %bb65, %bb56
  %.03 = phi i64 [ 0, %bb56 ], [ %i69, %bb65 ]
  %.0 = phi i64 [ 0, %bb56 ], [ %i66, %bb65 ]
  %i58 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i37)
  %i59 = icmp ne ptr %i58, null
  br i1 %i59, label %bb60, label %bb57.bb63_crit_edge

bb57.bb63_crit_edge:                              ; preds = %bb57
  br label %bb63

bb60:                                             ; preds = %bb57
  %i61 = call i32 @feof(ptr noundef %i37) #10
  %i62 = icmp eq i32 %i61, 0
  br label %bb63

bb63:                                             ; preds = %bb57.bb63_crit_edge, %bb60
  %i64 = phi i1 [ false, %bb57.bb63_crit_edge ], [ %i62, %bb60 ]
  br i1 %i64, label %bb65, label %bb70

bb65:                                             ; preds = %bb63
  %i66 = add nsw i64 %.0, 1
  %i67 = call i64 @strlen(ptr noundef @str_misc) #7
  %i68 = add i64 %i67, 1
  %i69 = add i64 %.03, %i68
  br label %bb57, !llvm.loop !30

bb70:                                             ; preds = %bb63
  %i71 = call i32 @fclose(ptr noundef %i29)
  %i72 = call i32 @fclose(ptr noundef %i37)
  %i73 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i64 noundef %.09, i64 noundef %.03)
  %i74 = mul i64 1, %.09
  %i75 = call noalias ptr @malloc(i64 noundef %i74) #11
  %i76 = mul i64 1, %.03
  %i77 = call noalias ptr @malloc(i64 noundef %i76) #11
  %i78 = getelementptr inbounds ptr, ptr %arg11, i64 1
  %i79 = load ptr, ptr %i78, align 8
  %i80 = call noalias ptr @fopen(ptr noundef %i79, ptr noundef @.str.1)
  %i81 = icmp eq ptr %i80, null
  br i1 %i81, label %bb82, label %bb85

bb82:                                             ; preds = %bb70
  %i83 = load ptr, ptr @stderr, align 8
  %i84 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i83, ptr noundef @.str.5)
  call void @exit(i32 noundef 1) #9
  unreachable

bb85:                                             ; preds = %bb70
  %i86 = getelementptr inbounds ptr, ptr %arg11, i64 2
  %i87 = load ptr, ptr %i86, align 8
  %i88 = call noalias ptr @fopen(ptr noundef %i87, ptr noundef @.str.1)
  %i89 = icmp eq ptr %i88, null
  br i1 %i89, label %bb90, label %bb93

bb90:                                             ; preds = %bb85
  %i91 = load ptr, ptr @stderr, align 8
  %i92 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i91, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #9
  unreachable

bb93:                                             ; preds = %bb85
  br label %bb94

bb94:                                             ; preds = %bb109, %bb93
  %.110 = phi i64 [ 0, %bb93 ], [ %i117, %bb109 ]
  %.12 = phi i64 [ 0, %bb93 ], [ %i114, %bb109 ]
  %i95 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i80)
  %i96 = icmp ne ptr %i95, null
  br i1 %i96, label %bb97, label %bb94.bb100_crit_edge

bb94.bb100_crit_edge:                             ; preds = %bb94
  br label %bb100

bb97:                                             ; preds = %bb94
  %i98 = call i32 @feof(ptr noundef %i80) #10
  %i99 = icmp eq i32 %i98, 0
  br label %bb100

bb100:                                            ; preds = %bb94.bb100_crit_edge, %bb97
  %i101 = phi i1 [ false, %bb94.bb100_crit_edge ], [ %i99, %bb97 ]
  br i1 %i101, label %bb102, label %bb118

bb102:                                            ; preds = %bb100
  %i103 = call i64 @strlen(ptr noundef @str_misc) #7
  %i104 = icmp ugt i64 %i103, 0
  br i1 %i104, label %bb105, label %bb102.bb109_crit_edge

bb102.bb109_crit_edge:                            ; preds = %bb102
  br label %bb109

bb105:                                            ; preds = %bb102
  %i106 = call i64 @strlen(ptr noundef @str_misc) #7
  %i107 = sub i64 %i106, 1
  %i108 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i107
  store i8 0, ptr %i108, align 1
  br label %bb109

bb109:                                            ; preds = %bb102.bb109_crit_edge, %bb105
  %i110 = getelementptr inbounds i8, ptr %i75, i64 %.110
  %i111 = call ptr @strcpy(ptr noundef %i110, ptr noundef @str_misc) #10
  %i112 = getelementptr inbounds i8, ptr %i75, i64 %.110
  %i113 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %.12
  store ptr %i112, ptr %i113, align 8
  %i114 = add nsw i64 %.12, 1
  %i115 = call i64 @strlen(ptr noundef @str_misc) #7
  %i116 = add i64 %i115, 1
  %i117 = add i64 %.110, %i116
  br label %bb94, !llvm.loop !31

bb118:                                            ; preds = %bb100
  %i119 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %.12
  store ptr null, ptr %i119, align 8
  br label %bb120

bb120:                                            ; preds = %bb135, %bb118
  %.14 = phi i64 [ 0, %bb118 ], [ %i143, %bb135 ]
  %.1 = phi i64 [ 0, %bb118 ], [ %i140, %bb135 ]
  %i121 = call ptr @fgets(ptr noundef @str_misc, i32 noundef 1024, ptr noundef %i88)
  %i122 = icmp ne ptr %i121, null
  br i1 %i122, label %bb123, label %bb120.bb126_crit_edge

bb120.bb126_crit_edge:                            ; preds = %bb120
  br label %bb126

bb123:                                            ; preds = %bb120
  %i124 = call i32 @feof(ptr noundef %i88) #10
  %i125 = icmp eq i32 %i124, 0
  br label %bb126

bb126:                                            ; preds = %bb120.bb126_crit_edge, %bb123
  %i127 = phi i1 [ false, %bb120.bb126_crit_edge ], [ %i125, %bb123 ]
  br i1 %i127, label %bb128, label %bb144

bb128:                                            ; preds = %bb126
  %i129 = call i64 @strlen(ptr noundef @str_misc) #7
  %i130 = icmp ugt i64 %i129, 0
  br i1 %i130, label %bb131, label %bb128.bb135_crit_edge

bb128.bb135_crit_edge:                            ; preds = %bb128
  br label %bb135

bb131:                                            ; preds = %bb128
  %i132 = call i64 @strlen(ptr noundef @str_misc) #7
  %i133 = sub i64 %i132, 1
  %i134 = getelementptr inbounds [1024 x i8], ptr @str_misc, i64 0, i64 %i133
  store i8 0, ptr %i134, align 1
  br label %bb135

bb135:                                            ; preds = %bb128.bb135_crit_edge, %bb131
  %i136 = getelementptr inbounds i8, ptr %i77, i64 %.14
  %i137 = call ptr @strcpy(ptr noundef %i136, ptr noundef @str_misc) #10
  %i138 = getelementptr inbounds i8, ptr %i77, i64 %.14
  %i139 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %.1
  store ptr %i138, ptr %i139, align 8
  %i140 = add nsw i64 %.1, 1
  %i141 = call i64 @strlen(ptr noundef @str_misc) #7
  %i142 = add i64 %i141, 1
  %i143 = add i64 %.14, %i142
  br label %bb120, !llvm.loop !32

bb144:                                            ; preds = %bb126
  %i145 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %.1
  store ptr null, ptr %i145, align 8
  %i146 = call i32 @fclose(ptr noundef %i80)
  %i147 = call i32 @fclose(ptr noundef %i88)
  %i148 = getelementptr inbounds ptr, ptr %arg11, i64 3
  %i149 = load ptr, ptr %i148, align 8
  %i150 = call noalias ptr @fopen(ptr noundef %i149, ptr noundef @.str.8)
  %i151 = icmp eq ptr %i150, null
  br i1 %i151, label %bb152, label %bb155

bb152:                                            ; preds = %bb144
  %i153 = load ptr, ptr @stderr, align 8
  %i154 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i153, ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #9
  unreachable

bb155:                                            ; preds = %bb144
  br label %bb156

bb156:                                            ; preds = %bb191, %bb155
  %.07 = phi i32 [ 0, %bb155 ], [ %i192, %bb191 ]
  %.05 = phi ptr [ null, %bb155 ], [ %.16, %bb191 ]
  %i157 = sext i32 %.07 to i64
  %i158 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %i157
  %i159 = load ptr, ptr %i158, align 8
  %i160 = icmp ne ptr %i159, null
  br i1 %i160, label %bb161, label %bb193

bb161:                                            ; preds = %bb156
  %i162 = sext i32 %.07 to i64
  %i163 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %i162
  %i164 = load ptr, ptr %i163, align 8
  call void @init_search(ptr noundef %i164)
  br label %bb165

bb165:                                            ; preds = %bb173, %bb161
  %.08 = phi i64 [ 0, %bb161 ], [ %i174, %bb173 ]
  %.16 = phi ptr [ %.05, %bb161 ], [ %i172, %bb173 ]
  %i166 = load i64, ptr %i, align 8
  %i167 = icmp slt i64 %.08, %i166
  br i1 %i167, label %bb168, label %bb175

bb168:                                            ; preds = %bb165
  %i169 = sext i32 %.07 to i64
  %i170 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %i169
  %i171 = load ptr, ptr %i170, align 8
  %i172 = call ptr @strsearch(ptr noundef %i171)
  br label %bb173

bb173:                                            ; preds = %bb168
  %i174 = add nsw i64 %.08, 1
  br label %bb165, !llvm.loop !33

bb175:                                            ; preds = %bb165
  %i176 = sext i32 %.07 to i64
  %i177 = getelementptr inbounds [128000 x ptr], ptr %i13, i64 0, i64 %i176
  %i178 = load ptr, ptr %i177, align 8
  %i179 = icmp ne ptr %.16, null
  %i180 = zext i1 %i179 to i64
  %i181 = select i1 %i179, ptr @.str.11, ptr @.str.12
  %i182 = sext i32 %.07 to i64
  %i183 = getelementptr inbounds [128000 x ptr], ptr %i12, i64 0, i64 %i182
  %i184 = load ptr, ptr %i183, align 8
  %i185 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.10, ptr noundef %i178, ptr noundef %i181, ptr noundef %i184)
  %i186 = icmp ne ptr %.16, null
  br i1 %i186, label %bb187, label %bb175.bb189_crit_edge

bb175.bb189_crit_edge:                            ; preds = %bb175
  br label %bb189

bb187:                                            ; preds = %bb175
  %i188 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.13, ptr noundef %.16)
  br label %bb189

bb189:                                            ; preds = %bb175.bb189_crit_edge, %bb187
  %i190 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i150, ptr noundef @.str.14)
  br label %bb191

bb191:                                            ; preds = %bb189
  %i192 = add nsw i32 %.07, 1
  br label %bb156, !llvm.loop !34

bb193:                                            ; preds = %bb156
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind allocsize(1) }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }
attributes #11 = { nounwind allocsize(0) }

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
!14 = distinct !{!14, !9}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = distinct !{!22, !9}
!23 = distinct !{!23, !9}
!24 = distinct !{!24, !9}
!25 = distinct !{!25, !9}
!26 = distinct !{!26, !9}
!27 = distinct !{!27, !9}
!28 = distinct !{!28, !9}
!29 = distinct !{!29, !9}
!30 = distinct !{!30, !9}
!31 = distinct !{!31, !9}
!32 = distinct !{!32, !9}
!33 = distinct !{!33, !9}
!34 = distinct !{!34, !9}
