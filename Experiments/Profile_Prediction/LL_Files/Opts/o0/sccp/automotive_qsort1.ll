; ModuleID = 'automotive_qsort1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.my3DVertexStruct = type { i32, i32, i32, double }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stderr = external global ptr, align 8
@.str.4 = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3.7 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4.8 = private unnamed_addr constant [18 x i8] c"sorted_output.dat\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open output file\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) #0 {
bb:
  %i = alloca i64, align 8
  %i3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %i4 = icmp eq ptr %i3, null
  br i1 %i4, label %bb5, label %bb8

bb5:                                              ; preds = %bb
  %i6 = load ptr, ptr @stderr, align 8
  %i7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i6, ptr noundef @.str.2)
  br label %bb23

bb8:                                              ; preds = %bb
  %i9 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i3, ptr noundef @.str.3, ptr noundef %i)
  %i10 = call i32 @fclose(ptr noundef %i3)
  br label %bb11

bb11:                                             ; preds = %bb20, %bb8
  %.01 = phi i64 [ 0, %bb8 ], [ %i21, %bb20 ]
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %.01, %i12
  br i1 %i13, label %bb14, label %bb22

bb14:                                             ; preds = %bb11
  %i15 = add nsw i64 %.01, 1
  %i16 = load i64, ptr %i, align 8
  %i17 = icmp eq i64 %i15, %i16
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  br label %bb20

bb20:                                             ; preds = %bb14
  %i21 = add nsw i64 %.01, 1
  br label %bb11, !llvm.loop !8

bb22:                                             ; preds = %bb11
  br label %bb23

bb23:                                             ; preds = %bb22, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb22 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compare(ptr noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg, i32 0, i32 3
  %i2 = load double, ptr %i, align 8
  %i3 = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg1, i32 0, i32 3
  %i4 = load double, ptr %i3, align 8
  %i5 = fcmp ogt double %i2, %i4
  br i1 %i5, label %bb6, label %bb7

bb6:                                              ; preds = %bb
  br label %bb11

bb7:                                              ; preds = %bb
  %i8 = fcmp oeq double %i2, %i4
  %i9 = zext i1 %i8 to i64
  %i10 = select i1 %i8, i32 0, i32 -1
  br label %bb11

bb11:                                             ; preds = %bb7, %bb6
  %i12 = phi i32 [ 1, %bb6 ], [ %i10, %bb7 ]
  ret i32 %i12
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %arg3) #0 {
bb:
  %i = alloca [60000 x %struct.my3DVertexStruct], align 16
  %i4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  %i6 = alloca i32, align 4
  %i7 = icmp slt i32 %arg, 2
  br i1 %i7, label %bb8, label %bb11

bb8:                                              ; preds = %bb
  %i9 = load ptr, ptr @stderr, align 8
  %i10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i9, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #4
  unreachable

bb11:                                             ; preds = %bb
  %i12 = getelementptr inbounds ptr, ptr %arg2, i64 1
  %i13 = load ptr, ptr %i12, align 8
  %i14 = call noalias ptr @fopen(ptr noundef %i13, ptr noundef @.str.1.5)
  br label %bb15

bb15:                                             ; preds = %bb28, %bb11
  %.0 = phi i32 [ 0, %bb11 ], [ %i56, %bb28 ]
  %i16 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i4)
  %i17 = icmp eq i32 %i16, 1
  br i1 %i17, label %bb18, label %bb15.bb26_crit_edge

bb15.bb26_crit_edge:                              ; preds = %bb15
  br label %bb26

bb18:                                             ; preds = %bb15
  %i19 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i5)
  %i20 = icmp eq i32 %i19, 1
  br i1 %i20, label %bb21, label %bb18.bb26_crit_edge

bb18.bb26_crit_edge:                              ; preds = %bb18
  br label %bb26

bb21:                                             ; preds = %bb18
  %i22 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i6)
  %i23 = icmp eq i32 %i22, 1
  br i1 %i23, label %bb24, label %bb21.bb26_crit_edge

bb21.bb26_crit_edge:                              ; preds = %bb21
  br label %bb26

bb24:                                             ; preds = %bb21
  %i25 = icmp slt i32 %.0, 60000
  br label %bb26

bb26:                                             ; preds = %bb21.bb26_crit_edge, %bb18.bb26_crit_edge, %bb15.bb26_crit_edge, %bb24
  %i27 = phi i1 [ false, %bb21.bb26_crit_edge ], [ false, %bb18.bb26_crit_edge ], [ false, %bb15.bb26_crit_edge ], [ %i25, %bb24 ]
  br i1 %i27, label %bb28, label %bb57

bb28:                                             ; preds = %bb26
  %i29 = load i32, ptr %i4, align 4
  %i30 = sext i32 %.0 to i64
  %i31 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i30
  %i32 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i31, i32 0, i32 0
  store i32 %i29, ptr %i32, align 8
  %i33 = load i32, ptr %i5, align 4
  %i34 = sext i32 %.0 to i64
  %i35 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i34
  %i36 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i35, i32 0, i32 1
  store i32 %i33, ptr %i36, align 4
  %i37 = load i32, ptr %i6, align 4
  %i38 = sext i32 %.0 to i64
  %i39 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i38
  %i40 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i39, i32 0, i32 2
  store i32 %i37, ptr %i40, align 8
  %i41 = load i32, ptr %i4, align 4
  %i42 = sitofp i32 %i41 to double
  %i43 = call double @pow(double noundef %i42, double noundef 2.000000e+00) #5
  %i44 = load i32, ptr %i5, align 4
  %i45 = sitofp i32 %i44 to double
  %i46 = call double @pow(double noundef %i45, double noundef 2.000000e+00) #5
  %i47 = fadd double %i43, %i46
  %i48 = load i32, ptr %i6, align 4
  %i49 = sitofp i32 %i48 to double
  %i50 = call double @pow(double noundef %i49, double noundef 2.000000e+00) #5
  %i51 = fadd double %i47, %i50
  %i52 = call double @sqrt(double noundef %i51) #5
  %i53 = sext i32 %.0 to i64
  %i54 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i53
  %i55 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i54, i32 0, i32 3
  store double %i52, ptr %i55, align 8
  %i56 = add nsw i32 %.0, 1
  br label %bb15, !llvm.loop !10

bb57:                                             ; preds = %bb26
  %i58 = call i32 @fclose(ptr noundef %i14)
  br label %bb59

bb59:                                             ; preds = %bb57
  %i60 = icmp ne i32 %arg3, 0
  br i1 %i60, label %bb61, label %bb59.bb63_crit_edge

bb59.bb63_crit_edge:                              ; preds = %bb59
  br label %bb63

bb61:                                             ; preds = %bb59
  %i62 = call i32 (ptr, ...) @printf(ptr noundef @.str.3.7, i32 noundef %.0)
  br label %bb63

bb63:                                             ; preds = %bb59.bb63_crit_edge, %bb61
  %i64 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 0
  call void @qsortx(ptr noundef %i64, i32 noundef %.0, i32 noundef 24, ptr noundef @compare)
  %i65 = icmp ne i32 %arg3, 0
  br i1 %i65, label %bb66, label %bb63.bb94_crit_edge

bb63.bb94_crit_edge:                              ; preds = %bb63
  br label %bb94

bb66:                                             ; preds = %bb63
  %i67 = call noalias ptr @fopen(ptr noundef @.str.4.8, ptr noundef @.str.5)
  %i68 = icmp eq ptr %i67, null
  br i1 %i68, label %bb69, label %bb72

bb69:                                             ; preds = %bb66
  %i70 = load ptr, ptr @stderr, align 8
  %i71 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i70, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #4
  unreachable

bb72:                                             ; preds = %bb66
  br label %bb73

bb73:                                             ; preds = %bb89, %bb72
  %.01 = phi i32 [ 0, %bb72 ], [ %i91, %bb89 ]
  %i74 = icmp slt i32 %.01, %.0
  br i1 %i74, label %bb75, label %bb92

bb75:                                             ; preds = %bb73
  %i76 = sext i32 %.01 to i64
  %i77 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i76
  %i78 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i77, i32 0, i32 0
  %i79 = load i32, ptr %i78, align 8
  %i80 = sext i32 %.01 to i64
  %i81 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i80
  %i82 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i81, i32 0, i32 1
  %i83 = load i32, ptr %i82, align 4
  %i84 = sext i32 %.01 to i64
  %i85 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i84
  %i86 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i85, i32 0, i32 2
  %i87 = load i32, ptr %i86, align 8
  %i88 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i67, ptr noundef @.str.7, i32 noundef %i79, i32 noundef %i83, i32 noundef %i87)
  br label %bb89

bb89:                                             ; preds = %bb75
  %i90 = sdiv i32 %.0, 100
  %i91 = add nsw i32 %.01, %i90
  br label %bb73, !llvm.loop !11

bb92:                                             ; preds = %bb73
  %i93 = call i32 @fclose(ptr noundef %i67)
  br label %bb94

bb94:                                             ; preds = %bb63.bb94_crit_edge, %bb92
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @qsortx(ptr noundef %arg, i32 noundef %arg7, i32 noundef %arg8, ptr noundef %arg9) #0 {
bb:
  %i = alloca [30 x ptr], align 16
  %i10 = alloca [30 x ptr], align 16
  %i11 = icmp ult i32 %arg7, 2
  br i1 %i11, label %bb.bb14_crit_edge, label %bb12

bb.bb14_crit_edge:                                ; preds = %bb
  br label %bb14

bb12:                                             ; preds = %bb
  %i13 = icmp eq i32 %arg8, 0
  br i1 %i13, label %bb12.bb14_crit_edge, label %bb15

bb12.bb14_crit_edge:                              ; preds = %bb12
  br label %bb14

bb14:                                             ; preds = %bb12.bb14_crit_edge, %bb.bb14_crit_edge
  br label %bb119

bb15:                                             ; preds = %bb12
  %i16 = sub i32 %arg7, 1
  %i17 = mul i32 %arg8, %i16
  %i18 = zext i32 %i17 to i64
  %i19 = getelementptr inbounds i8, ptr %arg, i64 %i18
  br label %bb20.outer

bb20.outer:                                       ; preds = %bb20.outer.backedge, %bb15
  %.06.ph = phi ptr [ %arg, %bb15 ], [ %.06.ph.be, %bb20.outer.backedge ]
  %.05.ph = phi ptr [ %i19, %bb15 ], [ %.05.ph.be, %bb20.outer.backedge ]
  %.0.ph = phi i32 [ 0, %bb15 ], [ %.0.ph.be, %bb20.outer.backedge ]
  br label %bb20

bb20:                                             ; preds = %bb20.outer, %bb102
  %.05 = phi ptr [ %i105, %bb102 ], [ %.05.ph, %bb20.outer ]
  %.0 = phi i32 [ %.2, %bb102 ], [ %.0.ph, %bb20.outer ]
  %i21 = ptrtoint ptr %.05 to i64
  %i22 = ptrtoint ptr %.06.ph to i64
  %i23 = sub i64 %i21, %i22
  %i24 = zext i32 %arg8 to i64
  %i25 = sdiv i64 %i23, %i24
  %i26 = add nsw i64 %i25, 1
  %i27 = trunc i64 %i26 to i32
  %i28 = icmp ule i32 %i27, 8
  br i1 %i28, label %bb29, label %bb30

bb29:                                             ; preds = %bb20
  call void @shortsort(ptr noundef %.06.ph, ptr noundef %.05, i32 noundef %arg8, ptr noundef %arg9)
  br label %bb108

bb30:                                             ; preds = %bb20
  %i31 = udiv i32 %i27, 2
  %i32 = mul i32 %i31, %arg8
  %i33 = zext i32 %i32 to i64
  %i34 = getelementptr inbounds i8, ptr %.06.ph, i64 %i33
  call void @swap(ptr noundef %i34, ptr noundef %.06.ph, i32 noundef %arg8)
  %i35 = zext i32 %arg8 to i64
  %i36 = getelementptr inbounds i8, ptr %.05, i64 %i35
  br label %bb37

bb37:                                             ; preds = %bb63, %bb30
  %.03 = phi ptr [ %.06.ph, %bb30 ], [ %i40, %bb63 ]
  %.01 = phi ptr [ %i36, %bb30 ], [ %i52, %bb63 ]
  br label %bb38

bb38:                                             ; preds = %bb46.bb38_crit_edge, %bb37
  %.14 = phi ptr [ %.03, %bb37 ], [ %i40, %bb46.bb38_crit_edge ]
  %i39 = zext i32 %arg8 to i64
  %i40 = getelementptr inbounds i8, ptr %.14, i64 %i39
  br label %bb41

bb41:                                             ; preds = %bb38
  %i42 = icmp ule ptr %i40, %.05
  br i1 %i42, label %bb43, label %bb41.bb46_crit_edge

bb41.bb46_crit_edge:                              ; preds = %bb41
  br label %bb46

bb43:                                             ; preds = %bb41
  %i44 = call i32 %arg9(ptr noundef %i40, ptr noundef %.06.ph)
  %i45 = icmp sle i32 %i44, 0
  br label %bb46

bb46:                                             ; preds = %bb41.bb46_crit_edge, %bb43
  %i47 = phi i1 [ false, %bb41.bb46_crit_edge ], [ %i45, %bb43 ]
  br i1 %i47, label %bb46.bb38_crit_edge, label %bb48, !llvm.loop !12

bb46.bb38_crit_edge:                              ; preds = %bb46
  br label %bb38

bb48:                                             ; preds = %bb46
  br label %bb49

bb49:                                             ; preds = %bb58.bb49_crit_edge, %bb48
  %.12 = phi ptr [ %.01, %bb48 ], [ %i52, %bb58.bb49_crit_edge ]
  %i50 = zext i32 %arg8 to i64
  %i51 = sub nsw i64 0, %i50
  %i52 = getelementptr inbounds i8, ptr %.12, i64 %i51
  br label %bb53

bb53:                                             ; preds = %bb49
  %i54 = icmp ugt ptr %i52, %.06.ph
  br i1 %i54, label %bb55, label %bb53.bb58_crit_edge

bb53.bb58_crit_edge:                              ; preds = %bb53
  br label %bb58

bb55:                                             ; preds = %bb53
  %i56 = call i32 %arg9(ptr noundef %i52, ptr noundef %.06.ph)
  %i57 = icmp sge i32 %i56, 0
  br label %bb58

bb58:                                             ; preds = %bb53.bb58_crit_edge, %bb55
  %i59 = phi i1 [ false, %bb53.bb58_crit_edge ], [ %i57, %bb55 ]
  br i1 %i59, label %bb58.bb49_crit_edge, label %bb60, !llvm.loop !13

bb58.bb49_crit_edge:                              ; preds = %bb58
  br label %bb49

bb60:                                             ; preds = %bb58
  %i61 = icmp ult ptr %i52, %i40
  br i1 %i61, label %bb62, label %bb63

bb62:                                             ; preds = %bb60
  br label %bb64

bb63:                                             ; preds = %bb60
  call void @swap(ptr noundef %i40, ptr noundef %i52, i32 noundef %arg8)
  br label %bb37

bb64:                                             ; preds = %bb62
  call void @swap(ptr noundef %.06.ph, ptr noundef %i52, i32 noundef %arg8)
  %i65 = getelementptr inbounds i8, ptr %i52, i64 -1
  %i66 = ptrtoint ptr %i65 to i64
  %i67 = ptrtoint ptr %.06.ph to i64
  %i68 = sub i64 %i66, %i67
  %i69 = ptrtoint ptr %.05 to i64
  %i70 = ptrtoint ptr %i40 to i64
  %i71 = sub i64 %i69, %i70
  %i72 = icmp sge i64 %i68, %i71
  br i1 %i72, label %bb73, label %bb90

bb73:                                             ; preds = %bb64
  %i74 = zext i32 %arg8 to i64
  %i75 = getelementptr inbounds i8, ptr %.06.ph, i64 %i74
  %i76 = icmp ult ptr %i75, %i52
  br i1 %i76, label %bb77, label %bb73.bb86_crit_edge

bb73.bb86_crit_edge:                              ; preds = %bb73
  br label %bb86

bb77:                                             ; preds = %bb73
  %i78 = sext i32 %.0 to i64
  %i79 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i78
  store ptr %.06.ph, ptr %i79, align 8
  %i80 = zext i32 %arg8 to i64
  %i81 = sub nsw i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i52, i64 %i81
  %i83 = sext i32 %.0 to i64
  %i84 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i83
  store ptr %i82, ptr %i84, align 8
  %i85 = add nsw i32 %.0, 1
  br label %bb86

bb86:                                             ; preds = %bb73.bb86_crit_edge, %bb77
  %.1 = phi i32 [ %i85, %bb77 ], [ %.0, %bb73.bb86_crit_edge ]
  %i87 = icmp ult ptr %i40, %.05
  br i1 %i87, label %bb88, label %bb89

bb88:                                             ; preds = %bb86
  br label %bb20.outer.backedge

bb89:                                             ; preds = %bb86
  br label %bb107

bb90:                                             ; preds = %bb64
  %i91 = icmp ult ptr %i40, %.05
  br i1 %i91, label %bb92, label %bb90.bb98_crit_edge

bb90.bb98_crit_edge:                              ; preds = %bb90
  br label %bb98

bb92:                                             ; preds = %bb90
  %i93 = sext i32 %.0 to i64
  %i94 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i93
  store ptr %i40, ptr %i94, align 8
  %i95 = sext i32 %.0 to i64
  %i96 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i95
  store ptr %.05, ptr %i96, align 8
  %i97 = add nsw i32 %.0, 1
  br label %bb98

bb98:                                             ; preds = %bb90.bb98_crit_edge, %bb92
  %.2 = phi i32 [ %i97, %bb92 ], [ %.0, %bb90.bb98_crit_edge ]
  %i99 = zext i32 %arg8 to i64
  %i100 = getelementptr inbounds i8, ptr %.06.ph, i64 %i99
  %i101 = icmp ult ptr %i100, %i52
  br i1 %i101, label %bb102, label %bb106

bb102:                                            ; preds = %bb98
  %i103 = zext i32 %arg8 to i64
  %i104 = sub nsw i64 0, %i103
  %i105 = getelementptr inbounds i8, ptr %i52, i64 %i104
  br label %bb20

bb106:                                            ; preds = %bb98
  br label %bb107

bb107:                                            ; preds = %bb106, %bb89
  %.3 = phi i32 [ %.1, %bb89 ], [ %.2, %bb106 ]
  br label %bb108

bb108:                                            ; preds = %bb107, %bb29
  %.4 = phi i32 [ %.0, %bb29 ], [ %.3, %bb107 ]
  %i109 = add nsw i32 %.4, -1
  %i110 = icmp sge i32 %i109, 0
  br i1 %i110, label %bb111, label %bb118

bb111:                                            ; preds = %bb108
  %i112 = sext i32 %i109 to i64
  %i113 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i112
  %i114 = load ptr, ptr %i113, align 8
  %i115 = sext i32 %i109 to i64
  %i116 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i115
  %i117 = load ptr, ptr %i116, align 8
  br label %bb20.outer.backedge

bb20.outer.backedge:                              ; preds = %bb111, %bb88
  %.06.ph.be = phi ptr [ %i40, %bb88 ], [ %i114, %bb111 ]
  %.05.ph.be = phi ptr [ %.05, %bb88 ], [ %i117, %bb111 ]
  %.0.ph.be = phi i32 [ %.1, %bb88 ], [ %i109, %bb111 ]
  br label %bb20.outer

bb118:                                            ; preds = %bb108
  br label %bb119

bb119:                                            ; preds = %bb118, %bb14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @shortsort(ptr noundef %arg, ptr noundef %arg3, i32 noundef %arg4, ptr noundef %arg5) #0 {
bb:
  br label %bb6

bb6:                                              ; preds = %bb20, %bb
  %.01 = phi ptr [ %arg3, %bb ], [ %i23, %bb20 ]
  %i = icmp ugt ptr %.01, %arg
  br i1 %i, label %bb7, label %bb24

bb7:                                              ; preds = %bb6
  %i8 = zext i32 %arg4 to i64
  %i9 = getelementptr inbounds i8, ptr %arg, i64 %i8
  br label %bb10

bb10:                                             ; preds = %bb17, %bb7
  %.02 = phi ptr [ %i9, %bb7 ], [ %i19, %bb17 ]
  %.0 = phi ptr [ %arg, %bb7 ], [ %.1, %bb17 ]
  %i11 = icmp ule ptr %.02, %.01
  br i1 %i11, label %bb12, label %bb20

bb12:                                             ; preds = %bb10
  %i13 = call i32 %arg5(ptr noundef %.02, ptr noundef %.0)
  %i14 = icmp sgt i32 %i13, 0
  br i1 %i14, label %bb15, label %bb12.bb16_crit_edge

bb12.bb16_crit_edge:                              ; preds = %bb12
  br label %bb16

bb15:                                             ; preds = %bb12
  br label %bb16

bb16:                                             ; preds = %bb12.bb16_crit_edge, %bb15
  %.1 = phi ptr [ %.02, %bb15 ], [ %.0, %bb12.bb16_crit_edge ]
  br label %bb17

bb17:                                             ; preds = %bb16
  %i18 = zext i32 %arg4 to i64
  %i19 = getelementptr inbounds i8, ptr %.02, i64 %i18
  br label %bb10, !llvm.loop !14

bb20:                                             ; preds = %bb10
  call void @swap(ptr noundef %.0, ptr noundef %.01, i32 noundef %arg4)
  %i21 = zext i32 %arg4 to i64
  %i22 = sub nsw i64 0, %i21
  %i23 = getelementptr inbounds i8, ptr %.01, i64 %i22
  br label %bb6, !llvm.loop !15

bb24:                                             ; preds = %bb6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @swap(ptr noundef %arg, ptr noundef %arg3, i32 noundef %arg4) #0 {
bb:
  %i = icmp ne ptr %arg, %arg3
  br i1 %i, label %bb5, label %bb.bb15_crit_edge

bb.bb15_crit_edge:                                ; preds = %bb
  br label %bb15

bb5:                                              ; preds = %bb
  br label %bb6

bb6:                                              ; preds = %bb9, %bb5
  %.02 = phi i32 [ %arg4, %bb5 ], [ %i7, %bb9 ]
  %.01 = phi ptr [ %arg3, %bb5 ], [ %i13, %bb9 ]
  %.0 = phi ptr [ %arg, %bb5 ], [ %i12, %bb9 ]
  %i7 = add i32 %.02, -1
  %i8 = icmp ne i32 %.02, 0
  br i1 %i8, label %bb9, label %bb14

bb9:                                              ; preds = %bb6
  %i10 = load i8, ptr %.0, align 1
  %i11 = load i8, ptr %.01, align 1
  %i12 = getelementptr inbounds i8, ptr %.0, i32 1
  store i8 %i11, ptr %.0, align 1
  %i13 = getelementptr inbounds i8, ptr %.01, i32 1
  store i8 %i10, ptr %.01, align 1
  br label %bb6, !llvm.loop !16

bb14:                                             ; preds = %bb6
  br label %bb15

bb15:                                             ; preds = %bb.bb15_crit_edge, %bb14
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0, !0}
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
