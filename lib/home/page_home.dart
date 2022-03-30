import 'package:carousel_slider/carousel_slider.dart';
import 'package:cubit_flutter/cubit/bidang/cubit/bidang_cubit.dart';
import 'package:cubit_flutter/cubit/cubit/cubit/banner_cubit.dart';
import 'package:cubit_flutter/cubit/cubit/fakultas/cubit/fakultas_cubit.dart';
import 'package:cubit_flutter/ress/ress_dataBid.dart';
import 'package:cubit_flutter/ress/ress_data_fakultas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageHome extends StatefulWidget {
  // final int id;
  PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BannerCubit()),
          BlocProvider(create: (context) => FakultasCubit()),
          BlocProvider(create: (context) => BidangCubit())
        ],
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 32, right: 25),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search Bar',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
                BlocBuilder<BannerCubit, BannerState>(
                  builder: (context, state) {
                    BannerCubit cubit = context.read<BannerCubit>();
                    if (state is BannerLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is BannerInitial) {
                      cubit.getBanner(context);
                    }
                    return CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true, initialPage: 0, height: 255),
                      items: cubit.ressBanner?.data?.map((e) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    Text('${e.nama}'),
                                    SizedBox(height: 15),
                                    Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              image: NetworkImage('${e.photo}'),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daftar Fakultas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                BlocBuilder<FakultasCubit, FakultasState>(
                    builder: (context, state) {
                  FakultasCubit cubit = context.read<FakultasCubit>();
                  if (state is FakultasInitial) {
                    cubit.getFakultas(context);
                  }
                  if (state is FakultasLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 100,
                    child: ListView.builder(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.ressFakultas?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          DataFakultas? data = cubit.ressFakultas?.data?[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('img/indonesia_food.jpg'),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text('${data?.fakultasNama}')
                            ],
                          );
                        }),
                  );
                }),
                BlocBuilder<BidangCubit, BidangState>(
                  builder: (context, state) {
                    BidangCubit cubit = context.read<BidangCubit>();
                    if (state is BidangInitial) {
                      cubit.getBidang(context);
                    }
                    if (state is BidangLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Expanded(
                      child: ListView.builder(
                          // shrinkWrap: true,
                          // scrollDirection: ,
                          itemCount: cubit.ressDataBid?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            DataBidang? data = cubit.ressDataBid?.data?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'img/indonesia_food.jpg'),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${data?.bidang}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "FITB",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: const [
                                              Image(
                                                image: AssetImage(
                                                    'img/homePage/navbar/file.png'),
                                                height: 15,
                                                color: Colors.amber,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Lihat Cv Terbaru",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
