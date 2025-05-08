; ModuleID = 'network_patricia.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ptree = type { i64, ptr, i8, i8, ptr, ptr }
%struct.ptree_mask = type { i64, ptr }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2.6 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3.7 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4.8 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1
@str = private unnamed_addr constant [7 x i8] c"Found.\00", align 1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %i) #13
  %i2 = tail call noalias ptr @fopen(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1)
  %i3 = icmp eq ptr %i2, null
  br i1 %i3, label %bb4, label %bb7

bb4:                                              ; preds = %bb
  %i5 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i6 = tail call i64 @fwrite(ptr nonnull @.str.2, i64 28, i64 1, ptr %i5) #14
  br label %bb21

bb7:                                              ; preds = %bb
  %i8 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef nonnull %i2, ptr noundef nonnull @.str.3, ptr noundef nonnull %i) #13
  %i9 = call i32 @fclose(ptr noundef nonnull %i2)
  %i10 = load i64, ptr %i, align 8, !tbaa !12
  %i11 = icmp sgt i64 %i10, 0
  br i1 %i11, label %bb12.preheader, label %bb7.bb21_crit_edge

bb7.bb21_crit_edge:                               ; preds = %bb7
  br label %bb21

bb12.preheader:                                   ; preds = %bb7
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb12.preheader
  %i13 = phi i64 [ %i19, %bb12.bb12_crit_edge ], [ %i10, %bb12.preheader ]
  %i14 = phi i64 [ %i15, %bb12.bb12_crit_edge ], [ 0, %bb12.preheader ]
  %i15 = add nuw nsw i64 %i14, 1
  %i16 = icmp eq i64 %i15, %i13
  %i17 = zext i1 %i16 to i32
  %i18 = call i32 @main1(i32 noundef %arg, ptr noundef %arg1, i32 noundef %i17) #13
  %i19 = load i64, ptr %i, align 8, !tbaa !12
  %i20 = icmp slt i64 %i15, %i19
  br i1 %i20, label %bb12.bb12_crit_edge, label %bb21.loopexit, !llvm.loop !14

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb21.loopexit:                                    ; preds = %bb12
  br label %bb21

bb21:                                             ; preds = %bb7.bb21_crit_edge, %bb21.loopexit, %bb4
  %i22 = phi i32 [ 1, %bb4 ], [ 0, %bb7.bb21_crit_edge ], [ 0, %bb21.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %i) #13
  ret i32 %i22
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #3

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local ptr @pat_insert(ptr noundef %arg, ptr noundef %arg1) local_unnamed_addr #0 {
bb:
  %i = icmp ne ptr %arg1, null
  %i2 = icmp ne ptr %arg, null
  %i3 = and i1 %i2, %i
  br i1 %i3, label %bb4, label %bb.bb120_crit_edge

bb.bb120_crit_edge:                               ; preds = %bb
  br label %bb120

bb4:                                              ; preds = %bb
  %i5 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 1
  %i6 = load ptr, ptr %i5, align 8, !tbaa !17
  %i7 = icmp eq ptr %i6, null
  br i1 %i7, label %bb4.bb120_crit_edge, label %bb8

bb4.bb120_crit_edge:                              ; preds = %bb4
  br label %bb120

bb8:                                              ; preds = %bb4
  %i9 = load i64, ptr %i6, align 8, !tbaa !19
  %i10 = load i64, ptr %arg, align 8, !tbaa !21
  %i11 = and i64 %i10, %i9
  store i64 %i11, ptr %arg, align 8, !tbaa !21
  br label %bb12

bb12:                                             ; preds = %bb12.bb12_crit_edge, %bb8
  %i13 = phi ptr [ %arg1, %bb8 ], [ %i24, %bb12.bb12_crit_edge ]
  %i14 = getelementptr inbounds %struct.ptree, ptr %i13, i64 0, i32 3
  %i15 = load i8, ptr %i14, align 1, !tbaa !22
  %i16 = zext nneg i8 %i15 to i32
  %i17 = lshr exact i32 -2147483648, %i16
  %i18 = sext i32 %i17 to i64
  %i19 = and i64 %i11, %i18
  %i20 = icmp eq i64 %i19, 0
  %i21 = getelementptr inbounds %struct.ptree, ptr %i13, i64 0, i32 5
  %i22 = getelementptr inbounds %struct.ptree, ptr %i13, i64 0, i32 4
  %i23 = select i1 %i20, ptr %i22, ptr %i21
  %i24 = load ptr, ptr %i23, align 8, !tbaa !8
  %i25 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 3
  %i26 = load i8, ptr %i25, align 1, !tbaa !22
  %i27 = icmp slt i8 %i15, %i26
  br i1 %i27, label %bb12.bb12_crit_edge, label %bb28, !llvm.loop !23

bb12.bb12_crit_edge:                              ; preds = %bb12
  br label %bb12

bb28:                                             ; preds = %bb12
  %i29 = load i64, ptr %i24, align 8, !tbaa !21
  %i30 = icmp eq i64 %i11, %i29
  br i1 %i30, label %bb33, label %bb31

bb31:                                             ; preds = %bb28
  %i32 = xor i64 %i29, %i11
  br label %bb94

bb33:                                             ; preds = %bb28
  %i34 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 2
  %i35 = load i8, ptr %i34, align 8, !tbaa !24
  %i36 = zext i8 %i35 to i64
  %i37 = icmp eq i8 %i35, 0
  br i1 %i37, label %bb33.bb54_crit_edge, label %bb38

bb33.bb54_crit_edge:                              ; preds = %bb33
  br label %bb54

bb38:                                             ; preds = %bb33
  %i39 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 1
  %i40 = load ptr, ptr %i39, align 8, !tbaa !17
  %i41 = zext i8 %i35 to i64
  br label %bb45

bb42:                                             ; preds = %bb45
  %i43 = add nuw nsw i64 %i46, 1
  %i44 = icmp eq i64 %i43, %i41
  br i1 %i44, label %bb54.loopexit, label %bb42.bb45_crit_edge, !llvm.loop !25

bb42.bb45_crit_edge:                              ; preds = %bb42
  br label %bb45

bb45:                                             ; preds = %bb42.bb45_crit_edge, %bb38
  %i46 = phi i64 [ 0, %bb38 ], [ %i43, %bb42.bb45_crit_edge ]
  %i47 = getelementptr inbounds %struct.ptree_mask, ptr %i40, i64 %i46
  %i48 = load i64, ptr %i47, align 8, !tbaa !19
  %i49 = icmp eq i64 %i9, %i48
  br i1 %i49, label %bb50, label %bb42

bb50:                                             ; preds = %bb45
  %i51 = getelementptr inbounds %struct.ptree_mask, ptr %i6, i64 0, i32 1
  %i52 = load ptr, ptr %i51, align 8, !tbaa !26
  %i53 = getelementptr inbounds %struct.ptree_mask, ptr %i40, i64 %i46, i32 1
  store ptr %i52, ptr %i53, align 8, !tbaa !26
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  br label %bb120

bb54.loopexit:                                    ; preds = %bb42
  br label %bb54

bb54:                                             ; preds = %bb33.bb54_crit_edge, %bb54.loopexit
  %i55 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 2
  %i56 = shl nuw nsw i64 %i36, 4
  %i57 = add nuw nsw i64 %i56, 16
  %i58 = tail call noalias ptr @malloc(i64 noundef %i57) #15
  %i59 = load i8, ptr %i55, align 8, !tbaa !24
  %i60 = icmp eq i8 %i59, 0
  br i1 %i60, label %bb54.bb85_crit_edge, label %bb61

bb54.bb85_crit_edge:                              ; preds = %bb54
  br label %bb85

bb61:                                             ; preds = %bb54
  %i62 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 1
  br label %bb63

bb63:                                             ; preds = %bb76.bb63_crit_edge, %bb61
  %i64 = phi i32 [ 0, %bb61 ], [ %i78, %bb76.bb63_crit_edge ]
  %i65 = phi i32 [ 0, %bb61 ], [ %i77, %bb76.bb63_crit_edge ]
  %i66 = phi ptr [ %i58, %bb61 ], [ %i79, %bb76.bb63_crit_edge ]
  %i67 = load i64, ptr %i6, align 8, !tbaa !19
  %i68 = load ptr, ptr %i62, align 8, !tbaa !17
  %i69 = sext i32 %i65 to i64
  %i70 = getelementptr inbounds %struct.ptree_mask, ptr %i68, i64 %i69
  %i71 = load i64, ptr %i70, align 8, !tbaa !19
  %i72 = icmp ugt i64 %i67, %i71
  br i1 %i72, label %bb73, label %bb75

bb73:                                             ; preds = %bb63
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i66, ptr noundef nonnull align 8 dereferenceable(16) %i70, i64 16, i1 false)
  %i74 = add nsw i32 %i65, 1
  br label %bb76

bb75:                                             ; preds = %bb63
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i66, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  store i64 4294967295, ptr %i6, align 8, !tbaa !19
  br label %bb76

bb76:                                             ; preds = %bb75, %bb73
  %i77 = phi i32 [ %i74, %bb73 ], [ %i65, %bb75 ]
  %i78 = phi i32 [ %i64, %bb73 ], [ 1, %bb75 ]
  %i79 = getelementptr inbounds %struct.ptree_mask, ptr %i66, i64 1
  %i80 = load i8, ptr %i55, align 8, !tbaa !24
  %i81 = zext i8 %i80 to i32
  %i82 = icmp slt i32 %i77, %i81
  br i1 %i82, label %bb76.bb63_crit_edge, label %bb83, !llvm.loop !27

bb76.bb63_crit_edge:                              ; preds = %bb76
  br label %bb63

bb83:                                             ; preds = %bb76
  %i84 = icmp eq i32 %i78, 0
  br label %bb85

bb85:                                             ; preds = %bb54.bb85_crit_edge, %bb83
  %i86 = phi ptr [ %i58, %bb54.bb85_crit_edge ], [ %i79, %bb83 ]
  %i87 = phi i1 [ true, %bb54.bb85_crit_edge ], [ %i84, %bb83 ]
  br i1 %i87, label %bb88, label %bb85.bb89_crit_edge

bb85.bb89_crit_edge:                              ; preds = %bb85
  br label %bb89

bb88:                                             ; preds = %bb85
  tail call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i86, ptr noundef nonnull align 8 dereferenceable(16) %i6, i64 16, i1 false)
  br label %bb89

bb89:                                             ; preds = %bb85.bb89_crit_edge, %bb88
  tail call void @free(ptr noundef %i6) #13
  tail call void @free(ptr noundef %arg) #13
  %i90 = load i8, ptr %i55, align 8, !tbaa !24
  %i91 = add i8 %i90, 1
  store i8 %i91, ptr %i55, align 8, !tbaa !24
  %i92 = getelementptr inbounds %struct.ptree, ptr %i24, i64 0, i32 1
  %i93 = load ptr, ptr %i92, align 8, !tbaa !17
  tail call void @free(ptr noundef %i93) #13
  store ptr %i58, ptr %i92, align 8, !tbaa !17
  br label %bb120

bb94:                                             ; preds = %bb100.bb94_crit_edge, %bb31
  %i95 = phi i32 [ 1, %bb31 ], [ %i101, %bb100.bb94_crit_edge ]
  %i96 = lshr exact i32 -2147483648, %i95
  %i97 = zext nneg i32 %i96 to i64
  %i98 = and i64 %i32, %i97
  %i99 = icmp eq i64 %i98, 0
  br i1 %i99, label %bb100, label %bb94.bb103_crit_edge

bb94.bb103_crit_edge:                             ; preds = %bb94
  br label %bb103

bb100:                                            ; preds = %bb94
  %i101 = add nuw nsw i32 %i95, 1
  %i102 = icmp eq i32 %i101, 32
  br i1 %i102, label %bb103split, label %bb100.bb94_crit_edge, !llvm.loop !28

bb100.bb94_crit_edge:                             ; preds = %bb100
  br label %bb94

bb103split:                                       ; preds = %bb100
  br label %bb103

bb103:                                            ; preds = %bb103split, %bb94.bb103_crit_edge
  %i104 = phi i32 [ %i95, %bb94.bb103_crit_edge ], [ 32, %bb103split ]
  %i105 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 3
  %i106 = load i8, ptr %i105, align 1, !tbaa !22
  %i107 = zext nneg i8 %i106 to i32
  %i108 = lshr exact i32 -2147483648, %i107
  %i109 = sext i32 %i108 to i64
  %i110 = and i64 %i11, %i109
  %i111 = icmp eq i64 %i110, 0
  br i1 %i111, label %bb116, label %bb112

bb112:                                            ; preds = %bb103
  %i113 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  %i114 = load ptr, ptr %i113, align 8, !tbaa !29
  %i115 = tail call fastcc ptr @insertR(ptr noundef %i114, ptr noundef nonnull %arg, i32 noundef %i104, ptr noundef nonnull %arg1)
  store ptr %i115, ptr %i113, align 8, !tbaa !29
  br label %bb120

bb116:                                            ; preds = %bb103
  %i117 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 4
  %i118 = load ptr, ptr %i117, align 8, !tbaa !30
  %i119 = tail call fastcc ptr @insertR(ptr noundef %i118, ptr noundef nonnull %arg, i32 noundef %i104, ptr noundef nonnull %arg1)
  store ptr %i119, ptr %i117, align 8, !tbaa !30
  br label %bb120

bb120:                                            ; preds = %bb4.bb120_crit_edge, %bb.bb120_crit_edge, %bb116, %bb112, %bb89, %bb50
  %i121 = phi ptr [ %i24, %bb50 ], [ %i24, %bb89 ], [ null, %bb4.bb120_crit_edge ], [ null, %bb.bb120_crit_edge ], [ %arg, %bb116 ], [ %arg, %bb112 ]
  ret ptr %i121
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #7

; Function Attrs: nofree nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define internal fastcc noundef ptr @insertR(ptr noundef %arg, ptr noundef %arg1, i32 noundef %arg2, ptr nocapture noundef readonly %arg3) unnamed_addr #8 {
bb:
  %i = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 3
  %i4 = load i8, ptr %i, align 1, !tbaa !22
  %i5 = sext i8 %i4 to i32
  %i6 = icmp slt i32 %i5, %arg2
  br i1 %i6, label %bb7, label %bb.bb11_crit_edge

bb.bb11_crit_edge:                                ; preds = %bb
  br label %bb11

bb7:                                              ; preds = %bb
  %i8 = getelementptr inbounds %struct.ptree, ptr %arg3, i64 0, i32 3
  %i9 = load i8, ptr %i8, align 1, !tbaa !22
  %i10 = icmp sgt i8 %i4, %i9
  br i1 %i10, label %bb23, label %bb7.bb11_crit_edge

bb7.bb11_crit_edge:                               ; preds = %bb7
  br label %bb11

bb11:                                             ; preds = %bb7.bb11_crit_edge, %bb.bb11_crit_edge
  %i12 = trunc i32 %arg2 to i8
  %i13 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 3
  store i8 %i12, ptr %i13, align 1, !tbaa !22
  %i14 = load i64, ptr %arg1, align 8, !tbaa !21
  %i15 = lshr exact i32 -2147483648, %arg2
  %i16 = sext i32 %i15 to i64
  %i17 = and i64 %i14, %i16
  %i18 = icmp eq i64 %i17, 0
  %i19 = select i1 %i18, ptr %arg1, ptr %arg
  %i20 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 4
  store ptr %i19, ptr %i20, align 8, !tbaa !30
  %i21 = select i1 %i18, ptr %arg, ptr %arg1
  %i22 = getelementptr inbounds %struct.ptree, ptr %arg1, i64 0, i32 5
  store ptr %i21, ptr %i22, align 8, !tbaa !29
  br label %bb29

bb23:                                             ; preds = %bb7
  %i24 = load i64, ptr %arg1, align 8, !tbaa !21
  %i25 = lshr exact i32 -2147483648, %i5
  %i26 = sext i32 %i25 to i64
  %i27 = and i64 %i24, %i26
  %i28 = icmp eq i64 %i27, 0
  br i1 %i28, label %bb35, label %bb31

bb29:                                             ; preds = %bb35, %bb31, %bb11
  %i30 = phi ptr [ %arg, %bb31 ], [ %arg, %bb35 ], [ %arg1, %bb11 ]
  ret ptr %i30

bb31:                                             ; preds = %bb23
  %i32 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 5
  %i33 = load ptr, ptr %i32, align 8, !tbaa !29
  %i34 = tail call fastcc ptr @insertR(ptr noundef %i33, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef %arg)
  store ptr %i34, ptr %i32, align 8, !tbaa !29
  br label %bb29

bb35:                                             ; preds = %bb23
  %i36 = getelementptr inbounds %struct.ptree, ptr %arg, i64 0, i32 4
  %i37 = load ptr, ptr %i36, align 8, !tbaa !30
  %i38 = tail call fastcc ptr @insertR(ptr noundef %i37, ptr noundef nonnull %arg1, i32 noundef %arg2, ptr noundef %arg)
  store ptr %i38, ptr %i36, align 8, !tbaa !30
  br label %bb29
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @pat_remove(ptr nocapture noundef readnone %arg, ptr nocapture noundef readnone %arg1) local_unnamed_addr #9 {
bb:
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local ptr @pat_search(i64 noundef %arg, ptr noundef readonly %arg1) local_unnamed_addr #10 {
bb:
  %i = icmp eq ptr %arg1, null
  br i1 %i, label %bb.bb34_crit_edge, label %bb2.preheader

bb.bb34_crit_edge:                                ; preds = %bb
  br label %bb34

bb2.preheader:                                    ; preds = %bb
  br label %bb2

bb2:                                              ; preds = %bb2.bb2_crit_edge, %bb2.preheader
  %i3 = phi ptr [ %i11, %bb2.bb2_crit_edge ], [ null, %bb2.preheader ]
  %i4 = phi ptr [ %i22, %bb2.bb2_crit_edge ], [ %arg1, %bb2.preheader ]
  %i5 = load i64, ptr %i4, align 8, !tbaa !21
  %i6 = getelementptr inbounds %struct.ptree, ptr %i4, i64 0, i32 1
  %i7 = load ptr, ptr %i6, align 8, !tbaa !17
  %i8 = load i64, ptr %i7, align 8, !tbaa !19
  %i9 = and i64 %i8, %arg
  %i10 = icmp eq i64 %i5, %i9
  %i11 = select i1 %i10, ptr %i4, ptr %i3
  %i12 = getelementptr inbounds %struct.ptree, ptr %i4, i64 0, i32 3
  %i13 = load i8, ptr %i12, align 1, !tbaa !22
  %i14 = zext nneg i8 %i13 to i32
  %i15 = lshr exact i32 -2147483648, %i14
  %i16 = sext i32 %i15 to i64
  %i17 = and i64 %i16, %arg
  %i18 = icmp eq i64 %i17, 0
  %i19 = getelementptr inbounds %struct.ptree, ptr %i4, i64 0, i32 5
  %i20 = getelementptr inbounds %struct.ptree, ptr %i4, i64 0, i32 4
  %i21 = select i1 %i18, ptr %i20, ptr %i19
  %i22 = load ptr, ptr %i21, align 8, !tbaa !8
  %i23 = getelementptr inbounds %struct.ptree, ptr %i22, i64 0, i32 3
  %i24 = load i8, ptr %i23, align 1, !tbaa !22
  %i25 = icmp slt i8 %i13, %i24
  br i1 %i25, label %bb2.bb2_crit_edge, label %bb26, !llvm.loop !31

bb2.bb2_crit_edge:                                ; preds = %bb2
  br label %bb2

bb26:                                             ; preds = %bb2
  %i27 = load i64, ptr %i22, align 8, !tbaa !21
  %i28 = getelementptr inbounds %struct.ptree, ptr %i22, i64 0, i32 1
  %i29 = load ptr, ptr %i28, align 8, !tbaa !17
  %i30 = load i64, ptr %i29, align 8, !tbaa !19
  %i31 = and i64 %i30, %arg
  %i32 = icmp eq i64 %i27, %i31
  %i33 = select i1 %i32, ptr %i22, ptr %i11
  br label %bb34

bb34:                                             ; preds = %bb.bb34_crit_edge, %bb26
  %i35 = phi ptr [ %i33, %bb26 ], [ null, %bb.bb34_crit_edge ]
  ret ptr %i35
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main1(i32 noundef %arg, ptr nocapture noundef readonly %arg1, i32 noundef %arg2) local_unnamed_addr #0 {
bb:
  %i = alloca [128 x i8], align 16
  %i3 = alloca %struct.in_addr, align 4
  %i4 = alloca float, align 4
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %i) #13
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i3) #13
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i4) #13
  %i5 = icmp slt i32 %arg, 2
  br i1 %i5, label %bb6, label %bb9

bb6:                                              ; preds = %bb
  %i7 = load ptr, ptr %arg1, align 8, !tbaa !8
  %i8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, ptr noundef %i7)
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb9:                                              ; preds = %bb
  %i10 = getelementptr inbounds ptr, ptr %arg1, i64 1
  %i11 = load ptr, ptr %i10, align 8, !tbaa !8
  %i12 = tail call noalias ptr @fopen(ptr noundef %i11, ptr noundef nonnull @.str.1.5)
  %i13 = icmp eq ptr %i12, null
  br i1 %i13, label %bb14, label %bb17

bb14:                                             ; preds = %bb9
  %i15 = load ptr, ptr %i10, align 8, !tbaa !8
  %i16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2.6, ptr noundef %i15)
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb17:                                             ; preds = %bb9
  %i18 = tail call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #15
  %i19 = icmp eq ptr %i18, null
  br i1 %i19, label %bb20, label %bb21

bb20:                                             ; preds = %bb17
  tail call void @perror(ptr noundef nonnull @.str.3.7) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb21:                                             ; preds = %bb17
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %i18, i8 0, i64 40, i1 false)
  %i22 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i23 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 1
  store ptr %i22, ptr %i23, align 8, !tbaa !17
  %i24 = icmp eq ptr %i22, null
  br i1 %i24, label %bb25, label %bb26

bb25:                                             ; preds = %bb21
  tail call void @perror(ptr noundef nonnull @.str.4.8) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb26:                                             ; preds = %bb21
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i22, i8 0, i64 16, i1 false)
  %i27 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i28 = getelementptr inbounds %struct.ptree_mask, ptr %i22, i64 0, i32 1
  store ptr %i27, ptr %i28, align 8, !tbaa !26
  %i29 = icmp eq ptr %i27, null
  br i1 %i29, label %bb30, label %bb31

bb30:                                             ; preds = %bb26
  tail call void @perror(ptr noundef nonnull @.str.5) #14
  tail call void @exit(i32 noundef 1) #16
  unreachable

bb31:                                             ; preds = %bb26
  store i8 0, ptr %i27, align 1
  %i32 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 2
  store i8 1, ptr %i32, align 8, !tbaa !24
  %i33 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 5
  store ptr %i18, ptr %i33, align 8, !tbaa !29
  %i34 = getelementptr inbounds %struct.ptree, ptr %i18, i64 0, i32 4
  store ptr %i18, ptr %i34, align 8, !tbaa !30
  %i35 = icmp ne i32 %arg2, 0
  br label %bb36

bb36:                                             ; preds = %bb70.bb36_crit_edge, %bb31
  %i37 = call ptr @fgets(ptr noundef nonnull %i, i32 noundef 128, ptr noundef nonnull %i12)
  %i38 = icmp eq ptr %i37, null
  br i1 %i38, label %bb76, label %bb39

bb39:                                             ; preds = %bb36
  %i40 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %i, ptr noundef nonnull @.str.6, ptr noundef nonnull %i4, ptr noundef nonnull %i3) #13
  %i41 = call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #15
  %i42 = icmp eq ptr %i41, null
  br i1 %i42, label %bb43, label %bb44

bb43:                                             ; preds = %bb39
  call void @perror(ptr noundef nonnull @.str.3.7) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb44:                                             ; preds = %bb39
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %i41, i8 0, i64 40, i1 false)
  %i45 = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i46 = getelementptr inbounds %struct.ptree, ptr %i41, i64 0, i32 1
  store ptr %i45, ptr %i46, align 8, !tbaa !17
  %i47 = icmp eq ptr %i45, null
  br i1 %i47, label %bb48, label %bb49

bb48:                                             ; preds = %bb44
  call void @perror(ptr noundef nonnull @.str.4.8) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb49:                                             ; preds = %bb44
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %i45, i8 0, i64 16, i1 false)
  %i50 = call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #15
  %i51 = getelementptr inbounds %struct.ptree_mask, ptr %i45, i64 0, i32 1
  store ptr %i50, ptr %i51, align 8, !tbaa !26
  %i52 = icmp eq ptr %i50, null
  br i1 %i52, label %bb53, label %bb54

bb53:                                             ; preds = %bb49
  call void @perror(ptr noundef nonnull @.str.5) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb54:                                             ; preds = %bb49
  store i8 0, ptr %i50, align 1
  %i55 = load i32, ptr %i3, align 4, !tbaa !32
  %i56 = zext i32 %i55 to i64
  store i64 %i56, ptr %i41, align 8, !tbaa !21
  store i64 4294967295, ptr %i45, align 8, !tbaa !19
  %i57 = call ptr @pat_search(i64 noundef %i56, ptr noundef nonnull %i18) #13
  %i58 = load i64, ptr %i57, align 8, !tbaa !21
  %i59 = load i32, ptr %i3, align 4, !tbaa !32
  %i60 = zext i32 %i59 to i64
  %i61 = icmp eq i64 %i58, %i60
  %i62 = and i1 %i35, %i61
  br i1 %i62, label %bb63, label %bb68

bb63:                                             ; preds = %bb54
  %i64 = load float, ptr %i4, align 4, !tbaa !35
  %i65 = fpext float %i64 to double
  %i66 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, double noundef %i65, i32 noundef %i59)
  %i67 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bb70

bb68:                                             ; preds = %bb54
  %i69 = call ptr @pat_insert(ptr noundef nonnull %i41, ptr noundef nonnull %i18) #13
  br label %bb70

bb70:                                             ; preds = %bb68, %bb63
  %i71 = phi ptr [ %i41, %bb63 ], [ %i69, %bb68 ]
  %i72 = icmp eq ptr %i71, null
  br i1 %i72, label %bb73, label %bb70.bb36_crit_edge, !llvm.loop !37

bb70.bb36_crit_edge:                              ; preds = %bb70
  br label %bb36

bb73:                                             ; preds = %bb70
  %i74 = load ptr, ptr @stderr, align 8, !tbaa !8
  %i75 = call i64 @fwrite(ptr nonnull @.str.9, i64 21, i64 1, ptr %i74) #14
  call void @exit(i32 noundef 1) #16
  unreachable

bb76:                                             ; preds = %bb36
  %i77 = call i32 @fclose(ptr noundef nonnull %i12)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i4) #13
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i3) #13
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %i) #13
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nofree nounwind
declare noundef ptr @fgets(ptr noundef, i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_sscanf(ptr nocapture noundef readonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nofree nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind memory(read, inaccessiblemem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { nounwind }
attributes #14 = { cold }
attributes #15 = { nounwind allocsize(0) }
attributes #16 = { noreturn nounwind }

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
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!18, !9, i64 8}
!18 = !{!"ptree", !13, i64 0, !9, i64 8, !10, i64 16, !10, i64 17, !9, i64 24, !9, i64 32}
!19 = !{!20, !13, i64 0}
!20 = !{!"ptree_mask", !13, i64 0, !9, i64 8}
!21 = !{!18, !13, i64 0}
!22 = !{!18, !10, i64 17}
!23 = distinct !{!23, !15, !16}
!24 = !{!18, !10, i64 16}
!25 = distinct !{!25, !15, !16}
!26 = !{!20, !9, i64 8}
!27 = distinct !{!27, !15, !16}
!28 = distinct !{!28, !15, !16}
!29 = !{!18, !9, i64 32}
!30 = !{!18, !9, i64 24}
!31 = distinct !{!31, !15, !16}
!32 = !{!33, !34, i64 0}
!33 = !{!"in_addr", !34, i64 0}
!34 = !{!"int", !10, i64 0}
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !10, i64 0}
!37 = distinct !{!37, !15, !16}
