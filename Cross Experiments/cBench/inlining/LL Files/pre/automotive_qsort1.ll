; ModuleID = 'automotive_qsort1.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.my3DVertexStruct = type { i32, i32, i32, double }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.4 = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3.7 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4.8 = private unnamed_addr constant [18 x i8] c"sorted_output.dat\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wt\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0AError: Can't open output file\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %arg, ptr noundef %arg2) local_unnamed_addr #0 {
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
  %i121 = load i64, ptr %i, align 8
  %i132 = icmp slt i64 0, %i121
  br i1 %i132, label %bb14.lr.ph, label %bb23.loopexit

bb14.lr.ph:                                       ; preds = %bb8
  br label %bb14

bb14:                                             ; preds = %bb14, %bb14.lr.ph
  %.013 = phi i64 [ 0, %bb14.lr.ph ], [ %i21, %bb14 ]
  %i15 = add nsw i64 %.013, 1
  %i16 = load i64, ptr %i, align 8
  %i17 = icmp eq i64 %i15, %i16
  %i18 = zext i1 %i17 to i32
  %i19 = call i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %i18)
  %i21 = add nsw i64 %.013, 1
  %i12 = load i64, ptr %i, align 8
  %i13 = icmp slt i64 %i21, %i12
  br i1 %i13, label %bb14, label %bb11.bb23.loopexit_crit_edge, !llvm.loop !8

bb11.bb23.loopexit_crit_edge:                     ; preds = %bb14
  br label %bb23.loopexit

bb23.loopexit:                                    ; preds = %bb11.bb23.loopexit_crit_edge, %bb8
  br label %bb23

bb23:                                             ; preds = %bb23.loopexit, %bb5
  %.0 = phi i32 [ 1, %bb5 ], [ 0, %bb23.loopexit ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) local_unnamed_addr #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) local_unnamed_addr #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #1

declare i32 @fclose(ptr noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compare(ptr noundef %arg, ptr noundef %arg1) #0 {
bb:
  %i = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg, i32 0, i32 3
  %i2 = load double, ptr %i, align 8
  %i3 = getelementptr inbounds %struct.my3DVertexStruct, ptr %arg1, i32 0, i32 3
  %i4 = load double, ptr %i3, align 8
  %i5 = fcmp ogt double %i2, %i4
  br i1 %i5, label %bb11, label %bb7

bb7:                                              ; preds = %bb
  %i8 = fcmp oeq double %i2, %i4
  %i10 = select i1 %i8, i32 0, i32 -1
  br label %bb11

bb11:                                             ; preds = %bb7, %bb
  %i12 = phi i32 [ %i10, %bb7 ], [ 1, %bb ]
  ret i32 %i12
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main1(i32 noundef %arg, ptr noundef %arg2, i32 noundef %arg3) local_unnamed_addr #0 {
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
  %i161 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i4)
  %i172 = icmp eq i32 %i161, 1
  br i1 %i172, label %bb18.lr.ph, label %bb57

bb18.lr.ph:                                       ; preds = %bb11
  br label %bb18

bb18:                                             ; preds = %bb28, %bb18.lr.ph
  %.03 = phi i32 [ 0, %bb18.lr.ph ], [ %i56, %bb28 ]
  %i19 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i5)
  %i20 = icmp eq i32 %i19, 1
  br i1 %i20, label %bb21, label %bb18.bb57_crit_edge

bb21:                                             ; preds = %bb18
  %i22 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i6)
  %i23 = icmp eq i32 %i22, 1
  %i25 = icmp slt i32 %.03, 60000
  %or.cond = select i1 %i23, i1 %i25, i1 false
  br i1 %or.cond, label %bb28, label %bb21.bb57_crit_edge

bb28:                                             ; preds = %bb21
  %i29 = load i32, ptr %i4, align 4
  %i30 = sext i32 %.03 to i64
  %i31 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i30
  %i32 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i31, i32 0, i32 0
  store i32 %i29, ptr %i32, align 8
  %i33 = load i32, ptr %i5, align 4
  %i34 = sext i32 %.03 to i64
  %i35 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i34
  %i36 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i35, i32 0, i32 1
  store i32 %i33, ptr %i36, align 4
  %i37 = load i32, ptr %i6, align 4
  %i38 = sext i32 %.03 to i64
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
  %i53 = sext i32 %.03 to i64
  %i54 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i53
  %i55 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i54, i32 0, i32 3
  store double %i52, ptr %i55, align 8
  %i56 = add nsw i32 %.03, 1
  %i16 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %i14, ptr noundef @.str.2.6, ptr noundef %i4)
  %i17 = icmp eq i32 %i16, 1
  br i1 %i17, label %bb18, label %bb15.bb57_crit_edge, !llvm.loop !10

bb21.bb57_crit_edge:                              ; preds = %bb21
  %split = phi i32 [ %.03, %bb21 ]
  br label %bb57

bb18.bb57_crit_edge:                              ; preds = %bb18
  %split4 = phi i32 [ %.03, %bb18 ]
  br label %bb57

bb15.bb57_crit_edge:                              ; preds = %bb28
  %split5 = phi i32 [ %i56, %bb28 ]
  br label %bb57

bb57:                                             ; preds = %bb15.bb57_crit_edge, %bb18.bb57_crit_edge, %bb21.bb57_crit_edge, %bb11
  %.0.lcssa = phi i32 [ %split, %bb21.bb57_crit_edge ], [ %split4, %bb18.bb57_crit_edge ], [ %split5, %bb15.bb57_crit_edge ], [ 0, %bb11 ]
  %i58 = call i32 @fclose(ptr noundef %i14)
  %i60 = icmp ne i32 %arg3, 0
  br i1 %i60, label %bb61, label %bb63

bb61:                                             ; preds = %bb57
  %i62 = call i32 (ptr, ...) @printf(ptr noundef @.str.3.7, i32 noundef %.0.lcssa)
  br label %bb63

bb63:                                             ; preds = %bb61, %bb57
  %i64 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 0
  call void @qsortx(ptr noundef %i64, i32 noundef %.0.lcssa, i32 noundef 24, ptr noundef @compare)
  %i65 = icmp ne i32 %arg3, 0
  br i1 %i65, label %bb66, label %bb94

bb66:                                             ; preds = %bb63
  %i67 = call noalias ptr @fopen(ptr noundef @.str.4.8, ptr noundef @.str.5)
  %i68 = icmp eq ptr %i67, null
  br i1 %i68, label %bb69, label %bb73.preheader

bb73.preheader:                                   ; preds = %bb66
  %i746 = icmp slt i32 0, %.0.lcssa
  br i1 %i746, label %bb75.lr.ph, label %bb92

bb75.lr.ph:                                       ; preds = %bb73.preheader
  br label %bb75

bb69:                                             ; preds = %bb66
  %i70 = load ptr, ptr @stderr, align 8
  %i71 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i70, ptr noundef @.str.6)
  call void @exit(i32 noundef 1) #4
  unreachable

bb75:                                             ; preds = %bb75, %bb75.lr.ph
  %.017 = phi i32 [ 0, %bb75.lr.ph ], [ %i91, %bb75 ]
  %i76 = sext i32 %.017 to i64
  %i77 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i76
  %i78 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i77, i32 0, i32 0
  %i79 = load i32, ptr %i78, align 8
  %i80 = sext i32 %.017 to i64
  %i81 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i80
  %i82 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i81, i32 0, i32 1
  %i83 = load i32, ptr %i82, align 4
  %i84 = sext i32 %.017 to i64
  %i85 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %i, i64 0, i64 %i84
  %i86 = getelementptr inbounds %struct.my3DVertexStruct, ptr %i85, i32 0, i32 2
  %i87 = load i32, ptr %i86, align 8
  %i88 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %i67, ptr noundef @.str.7, i32 noundef %i79, i32 noundef %i83, i32 noundef %i87)
  %i90 = sdiv i32 %.0.lcssa, 100
  %i91 = add nsw i32 %.017, %i90
  %i74 = icmp slt i32 %i91, %.0.lcssa
  br i1 %i74, label %bb75, label %bb73.bb92_crit_edge, !llvm.loop !11

bb73.bb92_crit_edge:                              ; preds = %bb75
  br label %bb92

bb92:                                             ; preds = %bb73.bb92_crit_edge, %bb73.preheader
  %i93 = call i32 @fclose(ptr noundef %i67)
  br label %bb94

bb94:                                             ; preds = %bb92, %bb63
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) local_unnamed_addr #3

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @qsortx(ptr noundef %arg, i32 noundef %arg7, i32 noundef %arg8, ptr noundef %arg9) local_unnamed_addr #0 {
bb:
  %i = alloca [30 x ptr], align 16
  %i10 = alloca [30 x ptr], align 16
  %i11 = icmp ult i32 %arg7, 2
  %i13 = icmp eq i32 %arg8, 0
  %or.cond = or i1 %i11, %i13
  br i1 %or.cond, label %bb119, label %bb15

bb15:                                             ; preds = %bb
  %i16 = sub i32 %arg7, 1
  %i17 = mul i32 %arg8, %i16
  %i18 = zext i32 %i17 to i64
  %i19 = getelementptr inbounds i8, ptr %arg, i64 %i18
  br label %bb20.outer

bb20.outer:                                       ; preds = %bb20.outer.backedge, %bb15
  %.06.ph = phi ptr [ %arg, %bb15 ], [ %.06.ph.be, %bb20.outer.backedge ]
  %.05.ph = phi ptr [ %i19, %bb15 ], [ %.05.ph.be, %bb20.outer.backedge ]
  %.0.ph = phi i32 [ 0, %bb15 ], [ %.0.ph.be, %bb20.outer.backedge ]
  %i211 = ptrtoint ptr %.05.ph to i64
  %i22 = ptrtoint ptr %.06.ph to i64
  %i232 = sub i64 %i211, %i22
  %i24 = zext i32 %arg8 to i64
  %i253 = sdiv i64 %i232, %i24
  %i264 = add nsw i64 %i253, 1
  %i275 = trunc i64 %i264 to i32
  %i286 = icmp ule i32 %i275, 8
  br i1 %i286, label %bb29, label %bb30.lr.ph

bb30.lr.ph:                                       ; preds = %bb20.outer
  br label %bb30

bb20.bb29_crit_edge:                              ; preds = %bb102
  %split = phi ptr [ %i105, %bb102 ]
  %split10 = phi i32 [ %.2, %bb102 ]
  br label %bb29

bb29:                                             ; preds = %bb20.bb29_crit_edge, %bb20.outer
  %.05.lcssa = phi ptr [ %split, %bb20.bb29_crit_edge ], [ %.05.ph, %bb20.outer ]
  %.0.lcssa = phi i32 [ %split10, %bb20.bb29_crit_edge ], [ %.0.ph, %bb20.outer ]
  call fastcc void @shortsort(ptr noundef %.06.ph, ptr noundef %.05.lcssa, i32 noundef %arg8, ptr noundef %arg9)
  br label %bb108

bb30:                                             ; preds = %bb102, %bb30.lr.ph
  %i279 = phi i32 [ %i275, %bb30.lr.ph ], [ %i27, %bb102 ]
  %.08 = phi i32 [ %.0.ph, %bb30.lr.ph ], [ %.2, %bb102 ]
  %.057 = phi ptr [ %.05.ph, %bb30.lr.ph ], [ %i105, %bb102 ]
  %i31 = udiv i32 %i279, 2
  %i32 = mul i32 %i31, %arg8
  %i33 = zext i32 %i32 to i64
  %i34 = getelementptr inbounds i8, ptr %.06.ph, i64 %i33
  call fastcc void @swap(ptr noundef %i34, ptr noundef %.06.ph, i32 noundef %arg8)
  %i35 = zext i32 %arg8 to i64
  %i36 = getelementptr inbounds i8, ptr %.057, i64 %i35
  br label %bb37

bb37:                                             ; preds = %bb63, %bb30
  %.03 = phi ptr [ %.06.ph, %bb30 ], [ %i40.lcssa, %bb63 ]
  %.01 = phi ptr [ %i36, %bb30 ], [ %i52.lcssa, %bb63 ]
  br label %bb38

bb38:                                             ; preds = %bb43, %bb37
  %.14 = phi ptr [ %.03, %bb37 ], [ %i40, %bb43 ]
  %i39 = zext i32 %arg8 to i64
  %i40 = getelementptr inbounds i8, ptr %.14, i64 %i39
  %i42 = icmp ule ptr %i40, %.057
  br i1 %i42, label %bb43, label %bb48

bb43:                                             ; preds = %bb38
  %i44 = call i32 %arg9(ptr noundef %i40, ptr noundef %.06.ph)
  %i45 = icmp sle i32 %i44, 0
  br i1 %i45, label %bb38, label %bb48, !llvm.loop !12

bb48:                                             ; preds = %bb43, %bb38
  %i40.lcssa = phi ptr [ %i40, %bb43 ], [ %i40, %bb38 ]
  br label %bb49

bb49:                                             ; preds = %bb55, %bb48
  %.12 = phi ptr [ %.01, %bb48 ], [ %i52, %bb55 ]
  %i50 = zext i32 %arg8 to i64
  %i51 = sub i64 0, %i50
  %i52 = getelementptr inbounds i8, ptr %.12, i64 %i51
  %i54 = icmp ugt ptr %i52, %.06.ph
  br i1 %i54, label %bb55, label %bb60

bb55:                                             ; preds = %bb49
  %i56 = call i32 %arg9(ptr noundef %i52, ptr noundef %.06.ph)
  %i57 = icmp sge i32 %i56, 0
  br i1 %i57, label %bb49, label %bb60, !llvm.loop !13

bb60:                                             ; preds = %bb55, %bb49
  %i52.lcssa = phi ptr [ %i52, %bb55 ], [ %i52, %bb49 ]
  %i61 = icmp ult ptr %i52.lcssa, %i40.lcssa
  br i1 %i61, label %bb64, label %bb63

bb63:                                             ; preds = %bb60
  call fastcc void @swap(ptr noundef %i40.lcssa, ptr noundef %i52.lcssa, i32 noundef %arg8)
  br label %bb37

bb64:                                             ; preds = %bb60
  %i52.lcssa.lcssa = phi ptr [ %i52.lcssa, %bb60 ]
  %i40.lcssa.lcssa = phi ptr [ %i40.lcssa, %bb60 ]
  call fastcc void @swap(ptr noundef %.06.ph, ptr noundef %i52.lcssa.lcssa, i32 noundef %arg8)
  %i65 = getelementptr inbounds i8, ptr %i52.lcssa.lcssa, i64 -1
  %i66 = ptrtoint ptr %i65 to i64
  %i67 = ptrtoint ptr %.06.ph to i64
  %i68 = sub i64 %i66, %i67
  %i69 = ptrtoint ptr %.057 to i64
  %i70 = ptrtoint ptr %i40.lcssa.lcssa to i64
  %i71 = sub i64 %i69, %i70
  %i72 = icmp sge i64 %i68, %i71
  br i1 %i72, label %bb73, label %bb90

bb73:                                             ; preds = %bb64
  %.05.lcssa3 = phi ptr [ %.057, %bb64 ]
  %.0.lcssa1 = phi i32 [ %.08, %bb64 ]
  %i52.lcssa.lcssa.lcssa = phi ptr [ %i52.lcssa.lcssa, %bb64 ]
  %i40.lcssa.lcssa.lcssa = phi ptr [ %i40.lcssa.lcssa, %bb64 ]
  %i74 = zext i32 %arg8 to i64
  %i75 = getelementptr inbounds i8, ptr %.06.ph, i64 %i74
  %i76 = icmp ult ptr %i75, %i52.lcssa.lcssa.lcssa
  br i1 %i76, label %bb77, label %bb86

bb77:                                             ; preds = %bb73
  %i78 = sext i32 %.0.lcssa1 to i64
  %i79 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i78
  store ptr %.06.ph, ptr %i79, align 8
  %i80 = zext i32 %arg8 to i64
  %i81 = sub i64 0, %i80
  %i82 = getelementptr inbounds i8, ptr %i52.lcssa.lcssa.lcssa, i64 %i81
  %i83 = sext i32 %.0.lcssa1 to i64
  %i84 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i83
  store ptr %i82, ptr %i84, align 8
  %i85 = add nsw i32 %.0.lcssa1, 1
  br label %bb86

bb86:                                             ; preds = %bb77, %bb73
  %.1 = phi i32 [ %i85, %bb77 ], [ %.0.lcssa1, %bb73 ]
  %i87 = icmp ult ptr %i40.lcssa.lcssa.lcssa, %.05.lcssa3
  br i1 %i87, label %bb20.outer.backedge, label %bb108

bb90:                                             ; preds = %bb64
  %i91 = icmp ult ptr %i40.lcssa.lcssa, %.057
  br i1 %i91, label %bb92, label %bb98

bb92:                                             ; preds = %bb90
  %i93 = sext i32 %.08 to i64
  %i94 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i93
  store ptr %i40.lcssa.lcssa, ptr %i94, align 8
  %i95 = sext i32 %.08 to i64
  %i96 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i95
  store ptr %.057, ptr %i96, align 8
  %i97 = add nsw i32 %.08, 1
  br label %bb98

bb98:                                             ; preds = %bb92, %bb90
  %.2 = phi i32 [ %i97, %bb92 ], [ %.08, %bb90 ]
  %i99 = zext i32 %arg8 to i64
  %i100 = getelementptr inbounds i8, ptr %.06.ph, i64 %i99
  %i101 = icmp ult ptr %i100, %i52.lcssa.lcssa
  br i1 %i101, label %bb102, label %bb108.loopexit

bb102:                                            ; preds = %bb98
  %i103 = zext i32 %arg8 to i64
  %i104 = sub i64 0, %i103
  %i105 = getelementptr inbounds i8, ptr %i52.lcssa.lcssa, i64 %i104
  %i21 = ptrtoint ptr %i105 to i64
  %i23 = sub i64 %i21, %i22
  %i25 = sdiv i64 %i23, %i24
  %i26 = add nsw i64 %i25, 1
  %i27 = trunc i64 %i26 to i32
  %i28 = icmp ule i32 %i27, 8
  br i1 %i28, label %bb20.bb29_crit_edge, label %bb30

bb108.loopexit:                                   ; preds = %bb98
  %.2.lcssa = phi i32 [ %.2, %bb98 ]
  br label %bb108

bb108:                                            ; preds = %bb108.loopexit, %bb86, %bb29
  %.4 = phi i32 [ %.0.lcssa, %bb29 ], [ %.1, %bb86 ], [ %.2.lcssa, %bb108.loopexit ]
  %i109 = add nsw i32 %.4, -1
  %i110 = icmp sge i32 %i109, 0
  br i1 %i110, label %bb111, label %bb119.loopexit

bb111:                                            ; preds = %bb108
  %i112 = sext i32 %i109 to i64
  %i113 = getelementptr inbounds [30 x ptr], ptr %i, i64 0, i64 %i112
  %i114 = load ptr, ptr %i113, align 8
  %i115 = sext i32 %i109 to i64
  %i116 = getelementptr inbounds [30 x ptr], ptr %i10, i64 0, i64 %i115
  %i117 = load ptr, ptr %i116, align 8
  br label %bb20.outer.backedge

bb20.outer.backedge:                              ; preds = %bb111, %bb86
  %.06.ph.be = phi ptr [ %i114, %bb111 ], [ %i40.lcssa.lcssa.lcssa, %bb86 ]
  %.05.ph.be = phi ptr [ %i117, %bb111 ], [ %.05.lcssa3, %bb86 ]
  %.0.ph.be = phi i32 [ %i109, %bb111 ], [ %.1, %bb86 ]
  br label %bb20.outer

bb119.loopexit:                                   ; preds = %bb108
  br label %bb119

bb119:                                            ; preds = %bb119.loopexit, %bb
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @shortsort(ptr noundef %arg, ptr noundef %arg3, i32 noundef %arg4, ptr noundef %arg5) unnamed_addr #0 {
bb:
  %i4 = icmp ugt ptr %arg3, %arg
  br i1 %i4, label %bb7.lr.ph, label %bb24

bb7.lr.ph:                                        ; preds = %bb
  br label %bb7

bb7:                                              ; preds = %bb20, %bb7.lr.ph
  %.015 = phi ptr [ %arg3, %bb7.lr.ph ], [ %i23, %bb20 ]
  %i8 = zext i32 %arg4 to i64
  %i9 = getelementptr inbounds i8, ptr %arg, i64 %i8
  %i111 = icmp ule ptr %i9, %.015
  br i1 %i111, label %bb12.lr.ph, label %bb20

bb12.lr.ph:                                       ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12, %bb12.lr.ph
  %.03 = phi ptr [ %arg, %bb12.lr.ph ], [ %.02..0, %bb12 ]
  %.022 = phi ptr [ %i9, %bb12.lr.ph ], [ %i19, %bb12 ]
  %i13 = call i32 %arg5(ptr noundef %.022, ptr noundef %.03)
  %i14 = icmp sgt i32 %i13, 0
  %.02..0 = select i1 %i14, ptr %.022, ptr %.03
  %i18 = zext i32 %arg4 to i64
  %i19 = getelementptr inbounds i8, ptr %.022, i64 %i18
  %i11 = icmp ule ptr %i19, %.015
  br i1 %i11, label %bb12, label %bb10.bb20_crit_edge, !llvm.loop !14

bb10.bb20_crit_edge:                              ; preds = %bb12
  %split = phi ptr [ %.02..0, %bb12 ]
  br label %bb20

bb20:                                             ; preds = %bb10.bb20_crit_edge, %bb7
  %.0.lcssa = phi ptr [ %split, %bb10.bb20_crit_edge ], [ %arg, %bb7 ]
  call fastcc void @swap(ptr noundef %.0.lcssa, ptr noundef %.015, i32 noundef %arg4)
  %i21 = zext i32 %arg4 to i64
  %i22 = sub i64 0, %i21
  %i23 = getelementptr inbounds i8, ptr %.015, i64 %i22
  %i = icmp ugt ptr %i23, %arg
  br i1 %i, label %bb7, label %bb6.bb24_crit_edge, !llvm.loop !15

bb6.bb24_crit_edge:                               ; preds = %bb20
  br label %bb24

bb24:                                             ; preds = %bb6.bb24_crit_edge, %bb
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @swap(ptr noundef %arg, ptr noundef %arg3, i32 noundef %arg4) unnamed_addr #0 {
bb:
  %i = icmp ne ptr %arg, %arg3
  br i1 %i, label %bb6.preheader, label %bb15

bb6.preheader:                                    ; preds = %bb
  %i71 = add i32 %arg4, -1
  %i82 = icmp ne i32 %arg4, 0
  br i1 %i82, label %bb9.lr.ph, label %bb15.loopexit

bb9.lr.ph:                                        ; preds = %bb6.preheader
  br label %bb9

bb9:                                              ; preds = %bb9, %bb9.lr.ph
  %i75 = phi i32 [ %i71, %bb9.lr.ph ], [ %i7, %bb9 ]
  %.04 = phi ptr [ %arg, %bb9.lr.ph ], [ %i12, %bb9 ]
  %.013 = phi ptr [ %arg3, %bb9.lr.ph ], [ %i13, %bb9 ]
  %i10 = load i8, ptr %.04, align 1
  %i11 = load i8, ptr %.013, align 1
  %i12 = getelementptr inbounds i8, ptr %.04, i32 1
  store i8 %i11, ptr %.04, align 1
  %i13 = getelementptr inbounds i8, ptr %.013, i32 1
  store i8 %i10, ptr %.013, align 1
  %i7 = add i32 %i75, -1
  %i8 = icmp ne i32 %i75, 0
  br i1 %i8, label %bb9, label %bb6.bb15.loopexit_crit_edge, !llvm.loop !16

bb6.bb15.loopexit_crit_edge:                      ; preds = %bb9
  br label %bb15.loopexit

bb15.loopexit:                                    ; preds = %bb6.bb15.loopexit_crit_edge, %bb6.preheader
  br label %bb15

bb15:                                             ; preds = %bb15.loopexit, %bb
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
